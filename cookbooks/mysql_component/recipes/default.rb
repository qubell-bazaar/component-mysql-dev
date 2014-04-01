#
# Cookbook Name:: mysql_component
# Recipe:: default
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

if node['platform'] == "ubuntu"
  execute "update packages cache" do
    command "apt-get update"
  end
#elsif node['platform'] == "rhel"
#  execute "update packages cache" do
#    command "yum --makecache"
end

include_recipe "mysql::server"

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

