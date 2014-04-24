#
# Cookbook Name:: mysql_component
# Recipe:: db_manage
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"
mysql_database node[:mysql_component][:schema][:dbname] do
  connection node[:mysql_component][:db]
  action node[:mysql_component][:schema][:db_action]
end

