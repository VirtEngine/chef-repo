name             "megam_zarafa"
maintainer       "Megam Systems"
maintainer_email "thomasalrin@megam.io"
license          "Apache 2.0"
description      "Installs/Configures zarafa"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5.0"


%w{ ubuntu debian }.each do |os|
  supports os
end

%w{ openssl database mysql openldap clamav dspam ark}.each do |dep|
  depends dep
end

