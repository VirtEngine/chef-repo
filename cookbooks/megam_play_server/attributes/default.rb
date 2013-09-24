

#AWS public DNS
#default["host"]["dns"] = "#{node[:ec2][:public_hostname]}"

if node['megam_version']
	default["play"]["deb"] = "https://s3-ap-southeast-1.amazonaws.com/megampub/#{node["megam_version"]}/debs/megam_play.deb"
else
	default["play"]["deb"] = "https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/debs/megam_play.deb"
end