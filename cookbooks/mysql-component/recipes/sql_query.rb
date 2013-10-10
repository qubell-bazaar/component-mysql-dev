#
# Cookbook Name:: mysql-component 
# Recipe:: mysql query
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
include_recipe "database::mysql"

sql_file = Chef::Config[:file_cache_path] + "/query.sql"
remote_file sql_file do
  source node['mysql-component']['sql_url']
  mode "0644"
  action :create
end

mysql_database 'run script' do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  sql { ::File.open("#{sql_file}").read }
  database_name node['mysql-component']['db_name']
  action :query
end

