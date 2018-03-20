name 'cron'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs cron'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '5.1.0'

recipe 'cron', 'Installs the cron package and starts the crond service.'

%w(ubuntu debian fedora redhat centos scientific oracle amazon smartos omnios solaris2 freebsd zlinux opensuse suse opensuseleap).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/cron'
issues_url 'https://github.com/chef-cookbooks/cron/issues'
chef_version '>= 12.7' if respond_to?(:chef_version)
