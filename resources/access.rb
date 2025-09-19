#
# Cookbook:: cron
# resource:: access
#
# Author:: Sander Botman <sbotman@schubergphilis.com>
# Author:: Tim Smith <tsmith@chef.io>
#
# Copyright:: 2014-2018, Sander Botman
# Copyright:: 2018-2019, Chef Software, Inc.
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

unified_mode true if respond_to?(:unified_mode)

property :user, String,
          name_property: true

action :allow do
  with_run_context :root do
    edit_resource(:template, '/etc/cron.allow') do |new_resource|
      source 'cron_manage.erb'
      cookbook 'cron'

      mode node['cron']['access_file_mode']

      variables['users'] ||= []
      variables['users'] << new_resource.user

      action :nothing
      delayed_action :create
    end
  end
end

action :deny do
  with_run_context :root do
    edit_resource(:template, '/etc/cron.deny') do |new_resource|
      source 'cron_manage.erb'
      cookbook 'cron'

      mode node['cron']['access_file_mode']

      variables['users'] ||= []
      variables['users'] << new_resource.user

      action :nothing
      delayed_action :create
    end
  end
end
