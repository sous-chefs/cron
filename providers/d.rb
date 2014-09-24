#
# Cookbook Name:: cron
# Provider:: d
#
# Copyright 2010-2013, Opscode, Inc.
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

# This pattern is used to make the providers compatible with Chef 10,
# which does not support use_inline_resources.
#
# FIXME: replace when Chef 12 is released.

action :delete do
  f = file "/etc/cron.d/#{new_resource.name}" do
    action :delete
  end
  new_resource.updated_by_last_action(f.updated_by_last_action?)
end

action :create do
  if node['platform_family'] == 'solaris2'
    fail 'Solaris does not support cron jobs in /etc/cron.d'
  end
  t = template "/etc/cron.d/#{new_resource.name}" do
    cookbook new_resource.cookbook
    source 'cron.d.erb'
    mode new_resource.mode
    variables(
                :name => new_resource.name,
                :predefined_value => new_resource.predefined_value,
                :minute => new_resource.minute,
                :hour => new_resource.hour,
                :day => new_resource.day,
                :month => new_resource.month,
                :weekday => new_resource.weekday,
                :command => new_resource.command,
                :user => new_resource.user,
                :mailto => new_resource.mailto,
                :path => new_resource.path,
                :home => new_resource.home,
                :shell => new_resource.shell,
                :comment => new_resource.comment,
                :environment => new_resource.environment
      )
    action :create
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)
end
