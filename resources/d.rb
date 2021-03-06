#
# Cookbook:: cron
# Resource:: d
#
# Copyright:: 2008-2019, Chef Software, Inc.
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

property :cron_name, String,
          name_property: true

property :cookbook, String,
          default: 'cron'

property :predefined_value, String,
          equal_to: %w( @reboot @yearly @annually @monthly @weekly @daily @midnight @hourly )

property :minute, [Integer, String],
          default: '*',
          callbacks: {
                       'should be a valid minute spec' => ->(spec) { ::Cron::Cookbook::CronHelpers.validate_numeric(spec, 0, 59) },
                     }

property :hour, [Integer, String],
          default: '*',
          callbacks: {
                       'should be a valid hour spec' => ->(spec) { ::Cron::Cookbook::CronHelpers.validate_numeric(spec, 0, 23) },
                     }

property :day, [Integer, String],
          default: '*',
          callbacks: {
                       'should be a valid day spec' => ->(spec) { ::Cron::Cookbook::CronHelpers.validate_numeric(spec, 1, 31) },
                     }

property :month, [Integer, String],
          default: '*',
          callbacks: {
                       'should be a valid month spec' => ->(spec) { ::Cron::Cookbook::CronHelpers.validate_month(spec) },
                     }

property :weekday, [Integer, String],
          default: '*',
          callbacks: {
                      'should be a valid weekday spec' => ->(spec) { ::Cron::Cookbook::CronHelpers.validate_dow(spec) },
                     }

property :command, String

property :user, String,
          default: 'root'

property :mailto, String

property :path, String

property :home, String

property :shell, String

property :comment, String

property :environment, Hash,
          default: {}

property :mode, [String, Integer],
          default: '0600'

property :random_delay, Integer

action_class do
  def sanitized_name
    new_resource.cron_name.tr('.', '-')
  end

  def required_properties_set?
    raise Chef::Exceptions::ValidationFailed, 'command is a required property' unless action.eql?(:delete) || !new_resource.command.nil?
  end

  def platform_check
    raise 'The cron_d resource requires Linux as it needs support for the cron.d directory functionality.' unless node['os'] == 'linux'
  end

  def create_template(create_action)
    platform_check
    required_properties_set?

    # cleanup the legacy named job if it exists
    file "#{new_resource.cron_name} legacy named cron.d file" do
      path "/etc/cron.d/#{new_resource.cron_name}"
      action :delete
      only_if { new_resource.cron_name != sanitized_name }
    end

    template "/etc/cron.d/#{sanitized_name}" do
      cookbook new_resource.cookbook
      source 'cron.d.erb'
      mode new_resource.mode
      variables(
        name: sanitized_name,
        predefined_value: new_resource.predefined_value,
        minute: new_resource.minute,
        hour: new_resource.hour,
        day: new_resource.day,
        month: new_resource.month,
        weekday: new_resource.weekday,
        command: new_resource.command,
        user: new_resource.user,
        mailto: new_resource.mailto,
        path: new_resource.path,
        home: new_resource.home,
        shell: new_resource.shell,
        comment: new_resource.comment,
        random_delay: new_resource.random_delay,
        environment: new_resource.environment
      )
      action create_action
    end
  end
end

%i(create create_if_missing).each do |action_type|
  send(:action, action_type) { create_template(action) }
end

action :delete do
  # cleanup the legacy named job if it exists
  file 'legacy named cron.d file' do
    path "/etc/cron.d/#{new_resource.cron_name}"
    action :delete
  end

  file "/etc/cron.d/#{sanitized_name}" do
    action :delete
  end
end
