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

