require 'minitest/spec'

require 'mysql'
def is_db_exists?(host, user, passwd, port, content)
  begin
    con = Mysql.new(host, user, passwd, '', port)
    db = con.list_dbs
    if db.include?("#{node['mysql_component']['schema']['dbname']}")
      return true
    else
      return false
    end
  rescue Mysql::Error
    return false
  end
end

describe_recipe 'mysql_component::db_manage' do
  it "creates database" do
    assert is_db_exists?("localhost","root","#{node['mysql']['server_root_password']}",node['mysql']['port'],"#{node['mysql_component']['schema']['dbname']}") == true, "Expected database #{node['mysql_component']['schema']['dbname']} exists"
  end
end
