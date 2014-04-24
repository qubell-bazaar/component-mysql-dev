require 'minitest/spec'

describe_recipe 'mysql_component::default' do
  it "install mysql-server package" do
    package("mysql-server").must_be_installed
  end
  it "mysql server is running" do
   if node["platform_family"] == 'rhel'
     service("mysqld").must_be_running
   elsif node["platform_family"] == 'debian'
     service("mysql").must_be_running
   end
  end
  it "firewall is disabled" do
    if node["platform_family"] == 'rhel'
      service("iptables").wont_be_running
    end
  end
end

sleep(20)
require 'socket'
require 'timeout'
def is_port_open?(ip, port)
  begin
    Timeout::timeout(1) do
      begin
        s = TCPSocket.new(ip, port)
        s.close
        return true
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
        return false
      end
    end
  rescue Timeout::Error
  end

  return false
end

describe_recipe 'mysql_component::default' do
  it "mysql is listening" do
    assert is_port_open?("#{node["ipaddress"]}", "#{node["mysql"]["port"]}") == true, "Expected port #{node["mysql"]["port"]} is open"
  end
end
