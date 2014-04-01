VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #Ubuntu 12.04
  config.vm.define "ubuntu12" do |ubuntu12_config|
    ubuntu12_config.vm.box = "ubuntu-12-x64"
    ubuntu12_config.vm.box_url = "/Users/jolly_rojer/Projects/Cometera/vagrant-boxes/ubuntu-12-x64.box"
    ubuntu12_config.vm.hostname = "ubuntu12.qubell.int"
    ubuntu12_config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    ubuntu12_config.vm.network "forwarded_port", guest: 8090, host: 8090, auto_correct: true
    ubuntu12_config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    ubuntu12_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    ubuntu12_config.vm.provision "chef_solo" do |chef| 
      chef.log_level = "debug"
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql_component::db_manage"
      chef.add_recipe "mysql_component::user_manage"
      chef.add_recipe "mysql_component::file_query"
        chef.json = {
          "mysql" => {
            "server_root_password" => "uR1zaebah0Qu",
            "server_repl_password" => "uR1zaebah0Qu",
            "server_debian_password" => "uR1zaebah0Qu"
          },
          "mysql_component" => {
            "schema" => {
              "host" => "localhost",
              "dbname" => "petclinic",
              "username" => "petclinic",
              "password" => "petclinic",
              "privileges" => ["all"],
              "action" => "grant",
              "db_action" => "create",
            },
            "hosts" => ["%"],
            "sql_url" => ["https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-schema.sql", "https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-dataload.sql"]
          }
        }
    end
  end
  
  #Ubuntu 10.04
  config.vm.define "ubuntu10" do |ubuntu10_config|
    ubuntu10_config.vm.box = "ubuntu-10-x64"
    ubuntu10_config.vm.box_url = "/Users/jolly_rojer/Projects/Cometera/vagrant-boxes/ubuntu-10-x64.box"
    ubuntu10_config.vm.hostname = "ubuntu10.qubell.int"
    ubuntu10_config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    ubuntu10_config.vm.network "forwarded_port", guest: 8090, host: 8090, auto_correct: true
    ubuntu10_config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    ubuntu10_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    ubuntu10_config.vm.provision "chef_solo" do |chef| 
      chef.log_level = "debug"
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql_component::db_manage"
      chef.add_recipe "mysql_component::user_manage"
      chef.add_recipe "mysql_component::file_query"
        chef.json = {
          "mysql" => {
            "server_root_password" => "uR1zaebah0Qu",
            "server_repl_password" => "uR1zaebah0Qu",
            "server_debian_password" => "uR1zaebah0Qu"
          },
          "mysql_component" => {
            "schema" => {
              "host" => "localhost",
              "dbname" => "petclinic",
              "username" => "petclinic",
              "password" => "petclinic",
              "privileges" => ["all"],
              "action" => "grant",
              "db_action" => "create",
            },
            "hosts" => ["%"],
            "sql_url" => ["https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-schema.sql", "https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-dataload.sql"]
          }
        }
    end
  end
  
  #CentOS 5.6
  config.vm.define "centos56" do |centos56_config|
    centos56_config.vm.box = "centos-5-x64"
    centos56_config.vm.box_url = "/Users/jolly_rojer/Projects/Cometera/vagrant-boxes/centos-5-x64.box"
    centos56_config.vm.hostname = "centos56.qubell.int"
    centos56_config.vm.network "forwarded_port", guest: 8080, host: 9000, auto_correct: true
    centos56_config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    centos56_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    centos56_config.vm.provision "chef_solo" do |chef| 
      chef.log_level = "debug"
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql_component::db_manage"
      chef.add_recipe "mysql_component::user_manage"
      chef.add_recipe "mysql_component::file_query"
        chef.json = {
          "mysql" => {
            "server_root_password" => "uR1zaebah0Qu",
            "server_repl_password" => "uR1zaebah0Qu",
            "server_debian_password" => "uR1zaebah0Qu"
          },
          "mysql_component" => {
            "schema" => {
              "host" => "localhost",
              "dbname" => "petclinic",
              "username" => "petclinic",
              "password" => "petclinic",
              "privileges" => ["all"],
              "action" => "grant",
              "db_action" => "create",
            },
            "hosts" => ["%"],
            "sql_url" => ["https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-schema.sql", "https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-dataload.sql"]
          }
        }
    end
  end

  #CentOS 6.3
  config.vm.define "centos63" do |centos63_config|
    centos63_config.vm.box = "centos_6_x64"
    centos63_config.vm.box_url = "/Users/jolly_rojer/Projects/Cometera/vagrant-boxes/centos_6_x64.box"
    centos63_config.vm.hostname = "centos63.qubell.int"
    centos63_config.vm.network "forwarded_port", guest: 8080, host: 9010, auto_correct: true
    centos63_config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    centos63_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    centos63_config.vm.provision "chef_solo" do |chef| 
      chef.log_level = "debug"
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql_component::db_manage"
      chef.add_recipe "mysql_component::user_manage"
      chef.add_recipe "mysql_component::file_query"
        chef.json = {
          "mysql" => {
            "server_root_password" => "uR1zaebah0Qu",
            "server_repl_password" => "uR1zaebah0Qu",
            "server_debian_password" => "uR1zaebah0Qu"
          },
          "mysql_component" => {
            "schema" => {
              "host" => "localhost",
              "dbname" => "petclinic",
              "username" => "petclinic",
              "password" => "petclinic",
              "privileges" => ["all"],
              "action" => "grant",
              "db_action" => "create",
            },
            "hosts" => ["%"],
            "sql_url" => ["https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-schema.sql", "https://raw.github.com/qubell/starter-java-web/master/src/main/resources/db/mysql/petclinic-mysql-dataload.sql"]
          }
        }
    end
  end
end
