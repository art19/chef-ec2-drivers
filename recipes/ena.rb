# frozen_string_literal: true

#
# Cookbook Name:: ec2-drivers
# Recipe:: ena
#
# Copyright 2020 ART19
#

raise NotImplementedError, "ec2-drivers::ena only supports CentOS/RHEL at this time, not #{node['platform']}" unless platform_family?('rhel')

version     = node['ec2-drivers']['ena']['version']
built_rpm   = "#{Chef::Config[:file_cache_path]}/ena-rpmbuild/noarch/ena-#{version}-1dkms.noarch.rpm"
install_loc = "#{node['ec2-drivers']['localrepo']['root']}/#{node['kernel']['machine']}/RPMS/ena-#{version}-1dkms.noarch.rpm"

directory "#{Chef::Config[:file_cache_path]}/ena-rpmbuild" do
  owner 'root'
  group 'root'
  mode  '0755'

  not_if { ::File.exist?(install_loc) }
end

remote_file "#{Chef::Config[:file_cache_path]}/ena-rpmbuild/amzn-drivers-ena_linux_#{version}.tar.gz" do
  source "https://github.com/amzn/amzn-drivers/archive/ena_linux_#{version}.tar.gz"
  owner  'root'
  group  'root'
  mode   '0644'

  checksum node['ec2-drivers']['ena']['checksums'][version]

  not_if { ::File.exist?(install_loc) }
end

template "#{Chef::Config[:file_cache_path]}/ena-rpmbuild/ena.spec" do
  source 'ena.spec.erb'
  owner  'root'
  group  'root'
  mode   '0644'

  variables(version: version)

  not_if { ::File.exist?(install_loc) }
end

execute 'Build ena RPM' do
  cwd         "#{Chef::Config[:file_cache_path]}/ena-rpmbuild"
  live_stream true

  command "rpmbuild -bb --define '_topdir %(pwd)' --define '_ntopdir %(pwd)' --define '_builddir %{_ntopdir}/build' " \
          "--define '_buildrootdir %{_builddir}' --define '_sourcedir %{_ntopdir}' --define '_specdir %{_ntopdir}' " \
          "--define '_rpmdir %{_ntopdir}' --define '_srcrpmdir %{_ntopdir}' " \
          'ena.spec'

  creates "#{Chef::Config[:file_cache_path]}/ena-rpmbuild/noarch/ena-#{version}-1dkms.noarch.rpm"

  not_if { ::File.exist?(install_loc) }
end

# Install the built RPM and then update the local repository
remote_file install_loc do
  source "file://#{built_rpm}"
  owner  'root'
  group  'root'
  mode   '0644'

  action :create_if_missing
  notifies :run, 'execute[Create/Update EC2 Drivers Yum Repository]', :immediately

  only_if { ::File.exist?(built_rpm) }
end

# Finally install our fresh package
package 'ena'

# And trigger a DKMS build (shouldn't be needed but is done in case it was missed)
execute "dkms install ena/#{version}" do
  live_stream true
end
