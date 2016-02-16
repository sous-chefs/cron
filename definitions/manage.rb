#
# Cookbook Name:: cron
# Definition:: manage
#
# Author:: Sander Botman. <sbotman@schubergphilis.com>
#
# Copyright:: 2014-2015, Sander Botman
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

define :cron_manage, user: nil, action: :deny do
  file = if params[:action] == :allow
           '/etc/cron.allow'
         else
           '/etc/cron.deny'
         end

  t = nil
  begin
    t = resources(template: file)
  rescue Chef::Exceptions::ResourceNotFound
    t = template file do
      source 'cron_manage.erb'
      cookbook 'cron'
      variables users: [],
                recipe_file: __FILE__.to_s.split('cookbooks/').last,
                template_file: source.to_s
    end
  end

  user = params[:user].nil? ? params[:name] : params[:user]
  t.variables[:users] << user
end
