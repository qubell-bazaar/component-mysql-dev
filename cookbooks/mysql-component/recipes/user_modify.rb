#
# Cookbook Name:: mysql-component 
# Recipe:: user_modify
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
include_recipe "mysql-component::user_drop"
include_recipe "mysql-component::user_create"

#mysql_database_user node['mysql-component']['db_username'] do
#  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
#  action :drop 
#end

#mysql_database_user node['mysql-component']['db_username'] do
#  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
#  host node['mysql-component']['host']
#  password node['mysql-component']['db_password']
#  database_name node['mysql-component']['db_name']
#  privileges node['mysql-component']['database']
#  action :grant
#end

