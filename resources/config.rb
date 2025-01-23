#
# Cookbook:: postgresql
# Resource:: config
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unified_mode true

require 'deepsort'

use 'partial/_config_file'

property :config_file, String,
          default: lazy { ::File.join(conf_dir, 'postgresql.conf') }

property :source, String,
          default: 'postgresql.conf.erb'

property :version, [String, Integer],
          default: lazy { installed_postgresql_major_version },
          desired_state: false,
          coerce: proc { |p| p.to_s },
          description: 'PostgreSQL installed version override'

property :data_directory, String,
          default: lazy { data_dir },
          description: 'PostgreSQL server data directory'

property :hba_file, String,
          description: 'PostgreSQL pg_hba.conf file location'

property :ident_file, String,
          description: 'PostgreSQL pg_ident.conf file location'

property :external_pid_file, String,
          description: 'PostgreSQL external PID file location'

property :server_config, Hash,
          default: {},
          coerce: proc { |p| p.transform_keys(&:to_s).deep_sort },
          description: 'PostgreSQL server configuration options'

load_current_value do |new_resource|
  current_value_does_not_exist! unless ::File.exist?(new_resource.config_file)

  if ::File.exist?(new_resource.config_file)
    owner ::Etc.getpwuid(::File.stat(new_resource.config_file).uid).name
    group ::Etc.getgrgid(::File.stat(new_resource.config_file).gid).name
    filemode ::File.stat(new_resource.config_file).mode.to_s(8)[-4..-1]
  end

  postgresql_server_config = PostgreSQL::Cookbook::ConfigHelpers.postgresql_conf_load_file(new_resource.config_file).fetch('global').deep_sort
  postgresql_server_config.transform_values! { |v| v.is_a?(String) ? v.gsub("'", '') : v }

  %w(data_directory hba_file ident_file external_pid_file).each do |p|
    next unless postgresql_server_config.fetch(p, nil)

    send(p, postgresql_server_config.delete(p))
  end

  server_config(postgresql_server_config)
end

action :create do
  converge_if_changed do
    config = {
      data_directory: new_resource.data_directory,
      hba_file: new_resource.hba_file,
      ident_file: new_resource.ident_file,
      external_pid_file: new_resource.external_pid_file,
    }

    config.merge!(new_resource.server_config.dup)
    config.transform_keys!(&:to_s)
    config.transform_values! { |v| v.is_a?(String) ? "'#{v}'" : v }

    template new_resource.config_file do
      cookbook new_resource.cookbook
      source new_resource.source

      owner new_resource.owner
      group new_resource.group
      mode new_resource.filemode

      variables(
        config:
      )

      action :create
    end

    service_dir = case installed_postgresql_package_source
                  when :os
                    '/etc/systemd/system/postgresql.service.d'
                  when :repo
                    "/etc/systemd/system/postgresql-#{new_resource.version}.service.d"
                  else
                    raise ArgumentError, "Unknown installation source: #{installed_postgresql_package_source}"
                  end

    if new_resource.external_pid_file
      directory service_dir do
        owner 'root'
        group 'root'
        mode '0755'
        action :create
      end

      template "#{service_dir}/10-pid.conf" do
        cookbook new_resource.cookbook
        source 'systemd/10-pid.conf.erb'

        owner 'root'
        group 'root'
        mode '0644'

        variables(
          version: new_resource.version
        )

        action :create
      end
    else
      directory(service_dir) { action(:delete) }
      file("#{service_dir}/10-pid.conf") { action(:delete) }
    end
  end
end

action :delete do
  file(new_resource.config_file) { action(:delete) }
end
