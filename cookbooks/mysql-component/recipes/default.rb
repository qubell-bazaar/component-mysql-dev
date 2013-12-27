#
# Cookbook Name:: mysql-component
# Recipe:: default
#
# Copyright 2013, Cometera
#
# All rights reserved - Do Not Redistribute
#
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

