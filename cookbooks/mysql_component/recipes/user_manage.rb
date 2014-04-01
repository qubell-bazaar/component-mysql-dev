#
# Cookbook Name:: mysql_component 
# Recipe:: user_manage
#
# Copyright 2014, Cometera
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"

(node['mysql_component']['hosts'] | ["localhost"]).each do |host|
  mysql_database_user node['mysql_component']['schema']['username'] do
    connection node['mysql_component']['db']
    host host
    password node['mysql_component']['schema']['password']
    database_name node['mysql_component']['schema']['dbname']
    privileges node['mysql_component']['schema']['privileges']
    action node['mysql_component']['schema']['action']
  end
end
