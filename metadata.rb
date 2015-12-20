name 'cron'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs cron'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.7.3'

recipe 'cron', 'Installs the cron package and starts the crond service.'

%w(ubuntu debian fedora redhat centos scientific oracle amazon smartos omnios solaris2 gentoo arch freebsd).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/cron' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/cron/issues' if respond_to?(:issues_url)
