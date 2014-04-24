include_recipe "mysql_component"

execute "sleep 30"  # Wait for MySQL startup

include_recipe "mysql_component::db_manage"
include_recipe "mysql_component::user_manage"
include_recipe "mysql_component::file_query"
include_recipe "minitest-handler"

execute "sleep 10"  # Wait for MySQL startup
