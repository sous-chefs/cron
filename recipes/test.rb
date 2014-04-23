#
# Cookbook Name:: cron
# Recipe:: test
#
# Copyright:: (c) 2012, Opscode, Inc.
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

include_recipe "cron"

cron_d "bizarrely-scheduled-usage-report" do
  minute "*/5"
  hour "1,23"
  day "2-5"
  command "/srv/app/scripts/generate_report"
  user "appuser"
end

cron_d "test-month-usage-report" do
  minute "0"
  hour "6"
  month "1"
  command "/srv/app/scripts/generate_report"
  user "appuser"
end

cron_d "test-weekday-usage-report" do
  minute "45"
  hour "13"
  weekday "7"
  command "/srv/app/scripts/generate_report"
  user "appuser"
end
