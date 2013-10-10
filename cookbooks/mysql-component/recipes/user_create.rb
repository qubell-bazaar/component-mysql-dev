#
# Cookbook Name:: mysql-component 
# Recipe:: user_create
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
include_recipe "database::mysql"

mysql_database_user node['mysql-component']['db_user'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  host node['mysql-component']['host']
  password node['mysql-component']['db_pass']
  database_name node['mysql-component']['db_name']
  privileges node['mysql-component']['priveleges']
  action :grant
end

