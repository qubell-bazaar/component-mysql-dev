#
# Cookbook Name:: mysql_component 
# Recipe::file_query
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"

sql_f = node['mysql_component']['sql_url']
sql_f.each_index do |i|
  sql_file = Chef::Config[:file_cache_path] + "/query#{i}.sql"
  remote_file sql_file do
    source sql_f[i]
    mode "0644"
    action :create
  end

  mysql_database "run #{sql_file}" do
    connection node['mysql_component']['schema']
    sql { ::File.open(sql_file).read }
    database_name node['mysql_component']['schema']['dbname']
    action :query
  end
end
