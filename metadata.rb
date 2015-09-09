name 'cron'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs cron'

version '1.6.1'

recipe 'cron', 'Installs the cron package and starts the crond service.'

%w(ubuntu debian fedora redhat centos scientific oracle amazon smartos omnios solaris2 gentoo).each do |os|
  supports os
end

source_url 'https://github.com/freeebsd-cookbooks/cron' if respond_to?(:source_url)
issues_url 'https://github.com/freebsd-cookbooks/cron/issues' if respond_to?(:issues_url)
