# frozen_string_literal: true
#
# Cookbook:: postgresql
# Resource:: database
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

# name property should take the form:
# database/extension

property :database, String, name_property: true
property :user,     String, default: 'postgres'
property :username, String
property :encoding, String, default: 'UTF-8'
property :locale,   String, default: 'en_US.UTF-8'
property :template, String, default: ''
property :host,     String
property :port,     Integer, default: 5432
property :encoding, String, default: 'UTF-8'
property :template, String, default: 'template0'
property :owner,    String

action :create do
  createdb = 'createdb'
  createdb << " -U #{new_resource.username}" if new_resource.username
  createdb << " -E #{new_resource.encoding}" if new_resource.encoding
  createdb << " -l #{new_resource.locale}" if new_resource.locale
  createdb << " -T #{new_resource.template}" if new_resource.template
  createdb << " -h #{new_resource.host}" if new_resource.host
  createdb << " -p #{new_resource.port}" if new_resource.port
  createdb << " -O #{new_resource.owner}" if new_resource.owner
  createdb << " #{new_resource.database}"

  bash "Create Database #{new_resource.database}" do
    code createdb
    user new_resource.username
    sensitive true
    not_if { database_exists?(new_resource) }
  end
end

action :drop do
  converge_by "Drop PostgreSQL Database #{new_resource.database}" do
    dropdb = 'dropdb'
    dropdb << " -U #{new_resource.username}" if new_resource.username
    dropdb << " --host #{new_resource.host}" if new_resource.host
    dropdb << " --port #{new_resource.port}" if new_resource.port
    dropdb << " #{new_resource.database}"

    bash "drop postgresql database #{new_resource.database})" do
      user 'postgres'
      command dropdb
      sensitive true
      only_if { database_exists?(new_resource) }
    end
  end
end

action_class do
  include PostgresqlCookbook::Helpers

  def database_exists?(new_resource)
    sql = %(SELECT datname from pg_database WHERE datname='#{new_resource.name}')

    exists = %(psql -c "#{sql}" postgres)
    exists << " --host #{new_resource.host}" if new_resource.host
    exists << " --port #{new_resource.port}" if new_resource.port
    exists << " | grep #{new_resource.name}"

    cmd = Mixlib::ShellOut.new(exists, user: 'postgres')
    cmd.run_command
    cmd.exitstatus == 0
  end
end
