#
# Cookbook Name:: mysql-component
# Recipe:: default
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
include_recipe "database::mysql"

["unzip", "wget", "curl", "git-core" ].each do |pkg|
  package pkg do
    action :install
  end
end

if platform_family?('rhel')
  execute "stop iptables" do
    command "if [ -e '/sbin/iptables' ]; then bash -c '/etc/init.d/iptables stop'; else echo $?; fi"
  end
end

if platform_family?('debian')
  execute "stop iptables" do
    command "if [ -e '/sbin/iptables' ]; then bash -c '/sbin/iptables -F'; else echo $?; fi"
  end
end

mysql_database node['mysql-component']['db_name'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

if ( !node['mysql-component']['sql_url'].empty? )
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
end

#mysql_database_user node['mysql-component']['db_user'] do
#  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
#  host node['mysql-component']['host']
#  password node['mysql-component']['db_pass']
#  database_name node['mysql-component']['db_name']
#  privileges node['mysql-component']['priveleges'] if not node['mysql-component']['priveleges'].empty?
#  action :grant
#end
