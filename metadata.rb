# frozen_string_literal: true

name             'ec2-drivers'
maintainer       'Keith Gable'
maintainer_email 'keith@art19.com'
license          'MIT'
description      'Cookbook that installs the latest versions of Amazon EC2 drivers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.4'

chef_version '>= 15' if respond_to?(:chef_version)
issues_url 'https://github.com/art19/chef-ec2-drivers/issues' if respond_to?(:issues_url)
source_url 'https://github.com/art19/chef-ec2-drivers' if respond_to?(:source_url)

supports 'centos', '>= 8'
supports 'redhat', '>= 8'
