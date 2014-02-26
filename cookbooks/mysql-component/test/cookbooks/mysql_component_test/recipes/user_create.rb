include_recipe "mysql-component"
include_recipe "mysql-component::user_create"
include_recipe "mysql::ruby"
include_recipe "minitest-handler"
