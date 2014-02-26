require 'minitest/spec'

require 'mysql'
def is_db_user_exists?(host, user, passwd, db, port, username, hostname)
  begin
    con = Mysql.new(host, user, passwd, db, port)
    uname = con.query("select User from user where user='#{username}' and host='#{hostname}'")
    u = uname.fetch_row()[0]
    if u.include?("#{username}")
      return true
    else
      return false
    end
  rescue Mysql::Error
    return false
  end
end

describe_recipe 'mysql_component::sql_query' do
  it "populates database" do
    assert is_db_user_exists?("localhost","root","#{node['mysql']['server_root_password']}","mysql",node['mysql']['port'],"#{node['mysql-component']['db_user']}","#{node['mysql-component']['host'][0]}") == true, "Expected user #{node['mysql-component']['db_user']} has access from #{node['mysql-component']['host'][0]}"
  end
end

