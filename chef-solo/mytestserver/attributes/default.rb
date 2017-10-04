#
# Attributes:: mytestserver
# Recipe:: default
#
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


default['elasticsearch-server']['java']['version'] = '8u131-b11-2ubuntu1.16.04.3'
default['elasticsearch-server']['elasticsearch']['version'] = '5.5.0'
default['elasticsearch-server']['elasticsearch']['cluster-name'] = 'elasticsearch'