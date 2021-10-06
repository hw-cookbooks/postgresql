postgresql_server_install 'postgresql' do
  password '12345'
  port 5432
  version node['test']['pg_ver']
  setup_repo true
  action [:install, :create]
end

postgresql_access 'postgresql host superuser' do
  access_type       'host'
  access_db         'all'
  access_user       'postgres'
  access_addr       '127.0.0.1/32'
  access_method     'md5'
  notifies :reload, 'service[postgresql]'
end

postgresql_user 'sous_chef' do
  superuser true
  password '67890'
  sensitive false
end

postgresql_user 'sous_chef' do
  attributes({ statement_timeout: '8min' })
  sensitive false
  action :update
end

postgresql_access 'a sous_chef local superuser' do
  access_type 'host'
  access_db 'all'
  access_user 'sous_chef'
  access_method 'md5'
  access_addr '127.0.0.1/32'
  notifies :reload, 'service[postgresql]'
end

postgresql_user 'name-with-dash' do
  password '1234'
end

postgresql_user 'name-with-dash' do
  attributes({ statement_timeout: '8min' })
  sensitive false
  action :update
end

postgresql_user 'dropable-user' do
  password '1234'
  action [:create, :drop]

  # Prevent the test suite from creating and dropping the user again. This
  # would raise an error during the second run, as it seems the resource didn't
  # converge properly.
  notifies :run, 'ruby_block[user_dropped]'
  not_if { node.attribute? 'user_dropped' }
end

ruby_block 'user_dropped' do
  block do
    node.normal['user_dropped'] = true
    node.save
  end
  action :nothing
end

service 'postgresql' do
  extend PostgresqlCookbook::Helpers
  service_name lazy { platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end
