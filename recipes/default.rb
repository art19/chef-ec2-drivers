# frozen_string_literal: true

#
# Cookbook Name:: ec2-drivers
# Recipe:: default
#
# Copyright 2021 ART19, Inc.
#

package %w[createrepo dkms kernel-devel kernel-headers rpm-build]

include_recipe '::localrepo'
include_recipe '::ena' if node['ec2-drivers']['ena']['install']
include_recipe '::ixgbevf' if intel? && node['ec2-drivers']['ixgbevf']['install']
