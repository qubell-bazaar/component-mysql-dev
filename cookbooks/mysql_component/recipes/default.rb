#
# Cookbook Name:: mysql_component
# Recipe:: default
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

case node[:platform] 
  when "ubuntu"
    execute "update packages cache" do
      command "apt-get update"
    end
  end

include_recipe "mysql::server"

case node[:platform_family]
  when "rhel"
    service "iptables" do
      action :stop
    end
  when "debian"
    service "ufw" do
      action :stop
    end
  end
