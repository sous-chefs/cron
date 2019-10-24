#
# Cookbook:: cron
# Attributes:: default
#
# Copyright:: 2010-2019, Chef Software, Inc
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
                                  when 'amazon'
                                    ['cronie']
                                  when 'rhel', 'fedora'
                                    node['platform_version'].to_i >= 6 ? ['cronie'] : ['vixie-cron']
                                  when 'suse'
                                    node['platform_version'].to_i >= 12 ? ['cronie'] : ['cron']
                                  when 'solaris2'
                                    'core-os'
                                  when 'pld'
                                    'cronie'
                                  else
                                    []
                                  end

default['cron']['service_name'] = case node['platform_family']
                                  when 'amazon', 'rhel', 'fedora', 'pld'
                                    'crond'
                                  else
                                    'cron'
                                  end
