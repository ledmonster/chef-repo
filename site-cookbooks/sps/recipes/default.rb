#
# Cookbook Name:: sps
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "python"
include_recipe "ssh"

python_virtualenv "/home/junya/sps" do
  interpreter "python2.7"
  action :create
  owner "junya"
  group "junya"
end

%w{django mysql-python}.each do |pkg|
  python_pip pkg do
    action :install
    virtualenv "/home/junya/sps"
    user "junya"
    group "junya"
  end
end

ssh_known_hosts "github.com" do
  hashed true
  user 'junya'
end

git "/home/junya/sps/sps" do
  repository "https://github.com/ledmonster/sps.git"  # https protocol doesn't require github account for read-only purpose
  reference "master"
  action :sync
  user "junya"
  group "junya"
end
