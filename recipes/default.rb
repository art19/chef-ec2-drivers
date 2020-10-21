# frozen_string_literal: true

#
# Cookbook Name:: ec2-drivers
# Recipe:: default
#
# Copyright 2020 ART19
#

include_recipe '::localrepo'
include_recipe '::ena'
include_recipe '::ixgbevf'
