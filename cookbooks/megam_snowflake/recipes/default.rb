#
# Cookbook Name:: snowflake
# Recipe:: default
#
# Copyright 2013, Megam Systems
#
# All rights reserved - Do Not Redistribute
#
  
=begin
node.set["myroute53"]["name"] = "#{node.name}"

if node['megam_domain']
node.set["myroute53"]["zone"] = "#{node['megam_domain']}"
else
node.set["myroute53"]["zone"] = "megam.co."
end

include_recipe "megam_route53"
=end

package "openjdk-7-jre" do
        action :install
end

remote_file node['snowflake']['location']['deb'] do
  source node['snowflake']['deb']
  owner node['snowflake']['user']
  group node['snowflake']['user']
  mode node['snowflake']['mode']
end

execute "dpkg snowflake" do
  cwd node['snowflake']['home']  
  user node['snowflake']['user']
  group node['snowflake']['user']
  command node['snowflake']['dpkg']
end

template node['snowflake']['id']['scala_conf'] do
  source node['snowflake']['template']['conf']
  owner "root"
  group "root"
  mode node['snowflake']['mode']
end

template node['snowflake']['id']['conf'] do
  source node['snowflake']['template']['upstart']
  owner node['snowflake']['user']
  group node['snowflake']['user']
  mode node['snowflake']['mode']
end

execute "Start snowflake" do
  cwd node['snowflake']['home']  
  user node['snowflake']['user']
  group node['snowflake']['user']
  command node['snowflake']['start']
end





