require 'minitest/spec'

require 'mysql'
def is_db_content_exists?(host, user, passwd, db, port, tablename)
  begin
    con = Mysql.new(host, user, passwd, db, port)
    lstables = con.list_tables
    if lstables.empty?
      return false
    else
      q = con.query "SELECT COUNT(*) FROM #{tablename}"
      if q.fetch_row()[0] == "10"
        return true
      else
        return false
      end
    end
  rescue Mysql::Error
    return false
  end
end

describe_recipe 'mysql_component::file_query' do
  it "populates database from sql files" do
    assert is_db_content_exists?("localhost",node['mysql_component']['schema']['username'],node['mysql_component']['schema']['password'],node['mysql_component']['schema']['dbname'],node['mysql']['port'],"owners") == true, "Expected db has tables and records"
  end
end

