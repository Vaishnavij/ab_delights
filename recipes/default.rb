#
# Cookbook:: ab_delights
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved

include_recipe "git"
include_recipe "passenger_apache2"

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

mysql_connection_info = {:host => "localhost",
                        :username => 'root',
                        :password => 'rootpass'}

group "demo" do
 gid 505
 action :create # see actions section below
end
user "demo" do
  uid 505
  gid 505
  action :create 
end
mysql_database 'demo' do
 connection mysql_connection_info
 action :create
end
mysql_database_user 'demo' do
  connection mysql_connection_info
  password 'awesome_password'
  action :create
end

application "demo.abdelights.com" do
  path "/usr/local/www/demo"
  owner "demo"
  group "demo"
  poise_git '/usr/local/www/demo' do
    deploy_key node.default['demo']['deploy_key']
    repository 'git@github.com:Vaishnavij/ab_delights.git'
    revision "HEAD"
  end
  ruby_runtime '2'
  ruby_gem 'rake'
  bundle_install 'Gemfile' do
    without 'development'
    deployment true
  end
end
web_app "abdelights" do
  docroot "/usr/local/www/demo"
  server_name "myproj.demo.abdelights.com"
  server_aliases [ "myproj", "demo.abdelights.com" ]
  rails_env "production"
end
