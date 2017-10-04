#
# Cookbook Name:: mytestserver
# Recipe:: default
#
# Copyright (C) 2017 Marco Moscatiello
#
# All rights reserved - Do Not Redistribute
#

package 'htop'

package 'openjdk-8-jdk' do
  version "#{node['elasticsearch-server']['java']['version']}"
end

apt_repository 'elasticsearch' do
  uri          'https://artifacts.elastic.co/packages/5.x/apt'
  distribution 'stable'
  components   ['main']
  key          'D88E42B4'
end

package 'elasticsearch' do
  version "#{node['elasticsearch-server']['elasticsearch']['version']}"
end

# execute 'install-ec2discovery-plugin' do
#   command './elasticsearch-plugin install discovery-ec2'
#   not_if  '/usr/share/elasticsearch/bin/elasticsearch-plugin list | grep discovery-ec2'
#   cwd     '/usr/share/elasticsearch/bin/'
# end