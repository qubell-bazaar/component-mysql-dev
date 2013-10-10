#
# Cookbook Name:: wordpress
# Recipe:: mysql
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
include_recipe "database::mysql"

mysql_database_user node['mysql-component']['db_user'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :drop 
end

