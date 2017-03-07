#
# Cookbook:: cron
# Recipe:: default
#
# Copyright:: 2010-2017, Chef Software, Inc.
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

package node['cron']['package_name']

service 'cron' do
  service_name node['cron']['service_name']
  action [:enable, :start]
end

# Some platforms (FreeBSD, Solaris) don't support /etc/cron.d, so we have to fake it.
if node['cron']['emulate_cron.d']
  directory '/etc/cron.d' do
    mode '0755'
    owner 'root'
    group node['root_group']
  end

  remote_file '/etc/crontab.os_source' do
    source 'file:///etc/crontab'
    owner 'root'
    group node['root_group']
    mode '0444'
    action :create_if_missing
  end

  template '/etc/crontab' do
    source 'crontab.erb'
    owner 'root'
    group node['root_group']
    mode '0644'
  end
end
