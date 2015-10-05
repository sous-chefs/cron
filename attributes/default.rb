default['cron']['package_name'] = case node['platform_family']
                                  when 'debian'
                                    ['cron']
                                  when 'rhel', 'fedora'
                                    node['platform_version'].to_f >= 6.0 ? ['cronie'] : ['vixie-cron']
                                  when 'solaris2'
                                    ['core-os']
                                  when 'arch'
                                    ['cronie']
                                  when 'gentoo'
                                    ['vixie-cron']
                                  else
                                    []
                                  end

default['cron']['service_name'] = case node['platform_family']
                                  when 'rhel', 'fedora'
                                    'crond'
                                  when 'arch'
                                    'cronie'
                                  when 'gentoo'
                                    'vixie-cron'
                                  end

# I think we can add Solaris to this list, but I don't have a Solaris box to test on.
# If so, remove the fail() in providers/d.rb
default['cron']['emulate_cron.d'] = case node['platform_family']
                                    when 'freebsd'
                                      true
                                    else
                                      false
                                    end
