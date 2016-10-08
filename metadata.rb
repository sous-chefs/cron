name 'cron'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs cron'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

recipe 'cron', 'Installs the cron package and starts the crond service.'

%w(ubuntu debian fedora redhat centos scientific oracle amazon smartos omnios solaris2 freebsd zlinux).each do |os|
  supports os
end

depends 'compat_resource', '>= 12.14.7'

source_url 'https://github.com/chef-cookbooks/cron'
issues_url 'https://github.com/chef-cookbooks/cron/issues'
chef_version '>= 12.1'
