#
# Cookbook Name:: mysql-component
# Recipe:: db_create
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"

mysql_database node['mysql-component']['db_name'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

if platform_family?('rhel')
  execute "stop iptables" do
    command "/etc/init.d/iptables stop"
  end
end

if platform_family?('debian')
  execute "stop iptables" do
    command "iptables -F"
  end
end
