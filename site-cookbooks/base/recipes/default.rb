#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{zsh}.each do |pkg|
  package pkg do
    action :install
  end
end

user "junya" do
  home "/home/junya"
  shell "/bin/zsh"
  action [:create, :manage]
end

group "wheel" do
  action [:modify]
  members ["junya"]
  append true
end
