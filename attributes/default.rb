#
# Cookbook:: cron
# Attributes:: default
#
# Copyright:: 2010-2017, Chef Software, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
default['cron']['package_name'] = case node['platform_family']
                                  when 'debian'
                                    ['cron']
                                  when 'amazon', 'rhel', 'fedora', 'suse'
                                    node['platform_version'].to_f >= 6.0 ? ['cronie'] : ['vixie-cron']
                                  when 'solaris2'
                                    'core-os'
                                  else
                                    []
                                  end

default['cron']['service_name'] = case node['platform_family']
                                  when 'amazon', 'rhel', 'fedora'
                                    'crond'
                                  else
                                    'cron'
                                  end

# I think we can add Solaris to this list, but I don't have a Solaris box to test on.
# If so, remove the fail() in providers/d.rb
default['cron']['emulate_cron.d'] = case node['platform_family']
                                    when 'freebsd'
                                      true
                                    else
                                      false
                                    end
