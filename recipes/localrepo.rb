# frozen_string_literal: true

#
# Cookbook Name:: ec2-drivers
# Recipe:: localrepo
#
# Copyright 2020 ART19
#

# This recipe creates a local repository

raise NotImplementedError, "ec2-drivers::localrepo only supports CentOS/RHEL at this time, not #{node['platform']}" unless platform_family?('rhel')

arch = node['kernel']['machine']
repo = "#{node['ec2-drivers']['localrepo']['root']}/#{arch}"

[
  node['ec2-drivers']['localrepo']['root'],
  repo,
  "#{repo}/RPMS"
].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode  '0755'
  end
end

# This is executed with `--workers 1` to make debugging easier if something explodes
execute 'Create/Update EC2 Drivers Yum Repository' do
  command "createrepo -v --workers 1 --update #{repo}"

  action :nothing

  notifies :create,    "yum_repository[ec2-drivers-#{arch}-local]", :immediately
  notifies :makecache, "yum_repository[ec2-drivers-#{arch}-local]", :immediately
end

yum_repository "ec2-drivers-#{arch}-local" do
  description "EC2 Drivers #{arch} local repo"
  baseurl     "file://#{repo}"
  enabled     true
  gpgcheck    false

  action :nothing
end
