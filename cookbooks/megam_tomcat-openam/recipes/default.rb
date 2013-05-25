#
# Cookbook Name:: megam_tomcat-openam
# Recipe:: default
#It can give an instance with opendj+openam
# Copyright 2012, Megam Systems
#
# All rights reserved - Do Not Redistribute
#

require 'date' #for Date
dat = Date.today
node.set["myroute53"]["name"] = 'openam-logstash'
node.set["myroute53"]["zone"] = 'megam.co.in.'
include_recipe "megam_route53"

include_recipe "apt"

node.set['logstash']['agent']['key'] = 'testKey'
node.set['logstash']['agent']['file-path'] = "/home/ubuntu/tomcat/logs/localhost_access_log.#{dat}.txt"
node.set['logstash']['agent']['server_ipaddress'] = 'redis1.megam.co.in'

include_recipe "logstash::agent"

include_recipe "tomcat-openam::full_stack"

