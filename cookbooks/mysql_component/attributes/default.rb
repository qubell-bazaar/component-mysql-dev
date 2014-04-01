default[:mysql_component][:db][:username] = "root"
default[:mysql_component][:db][:password] = node[:mysql][:server_root_password]
default[:mysql_component][:db][:host] = "localhost"
default[:mysql_component][:db][:port] = node[:mysql][:port]

default[:mysql_component][:schema][:username] = nil
default[:mysql_component][:schema][:password] = nil
default[:mysql_component][:schema][:host] = node[:mysql_component][:db][:host] 
default[:mysql_component][:schema][:port] = node[:mysql][:port]
default[:mysql_component][:schema][:privileges] = ["all"]
default[:mysql_component][:schema][:action] = nil
default[:mysql_component][:schema][:dbname] = nil

default[:mysql_component][:sql_url] = nil
default[:mysql_component][:hosts] = ["localhost"]
