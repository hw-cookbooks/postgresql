# frozen_string_literal: true
#
# Cookbook:: postgresql
# Recipe:: server
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

postgresql_client_install 'Postgresql Client'

postgresql_server_install 'Postgresql Server' do
  password node['postgresql']['password']['postgres']
end

# TODO: Find a trick to push attribute as action sym. Today that generate and exeception
# notifies node['postgresql']['server']['config_change_notify'].to_sym
postgresql_server_conf 'PostgreSQL Config' do
  notifies :reload, 'service[postgresql]'
end

service 'postgresql' do
  service_name lazy { platform_service_name }
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end
