name             "cron"
maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs cron"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.3.10"

%w{redhat centos scientific fedora amazon debian ubuntu raspbian solaris2 gentoo}.each do |os|
  supports os
end

recipe "cron", "Installs the cron package and starts the crond service."
recipe "cron::test", "A test recipe using the cron_d resource."
