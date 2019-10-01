#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2008-2018, Chef Software, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

apt_update

include_recipe 'cron'

##########################
# Test the cron_d resource
##########################

# create a file with periods as if the older version of this cookbook raspbian
# the provider should clean it up and we'll test that it doesn't exists
file '/etc/cron.d/job.with.periods' do
  content 'old junk'
  action :create
end

cron_d 'bizarrely-scheduled-usage-report' do
  minute '*/5'
  hour '1,23'
  day '2-5'
  command '/srv/app/scripts/generate_report'
  user 'appuser'
  action :create
end

cron_d 'test-month-usage-report' do
  minute '0'
  hour '6'
  month '1'
  command '/srv/app/scripts/generate_report'
  user 'appuser'
  action :create
end

cron_d 'test-weekday-usage-report' do
  minute '45'
  hour '13'
  weekday '7'
  command '/srv/app/scripts/generate_report'
  user 'appuser'
  action :create
end

cron_d 'fixnum-job' do
  minute 0
  hour 1
  day 2
  command '/bin/true'
  user 'appuser'
  action :create
end

cron_d 'fixnum-weekdayjob' do
  minute 0
  hour 1
  weekday 2
  command '/bin/true'
  user 'appuser'
  action :create
end

cron_d 'predefined_value_check' do
  predefined_value '@midnight'
  command '/bin/true'
  user 'appuser'
  action :create
end

cron_d 'nil_value_check' do
  command '/bin/true'
  user 'appuser'
  action :create
end

cron_d 'no_value_check' do
  command '/bin/true'
  user 'appuser'
  action :create_if_missing
end

cron_d 'job.with.periods' do
  command '/bin/true'
  user 'appuser'
  action :create_if_missing
end

cron_d 'with_random_delay' do
  command '/bin/true'
  user 'appuser'
  action :create_if_missing
  random_delay 60
end

cron_d 'test-weekday-usage-report2' do
  name 'test-weekday-usage-report'
  minute '1'
  hour '1'
  weekday '1'
  command '/this/should/never/run'
  user 'appuser'
  action :create_if_missing
end

file '/etc/cron.d/delete_cron' do
  content '* * * * * appuser /bin/true'
end

cron_d 'delete_cron' do
  action :delete
end

##########################
# Test the manage resource
##########################

cron_access 'alice' do
  action :allow
end

cron_access 'bob' do
  action :allow
end

cron_access 'tom' do
  action :allow
end

# legacy resource name
cron_manage 'Bill breaks things. Take away cron' do # rubocop: disable ChefModernize/CronManageResource
  user 'bill'
  action :deny
end
