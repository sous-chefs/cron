#
# Cookbook Name:: cron
# Resource:: d
#
# Copyright 2008-2016, Chef Software, Inc.
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

require 'helpers'

class Chef
  class Resource
    class CronD < ChefCompat::Resource
      use_automatic_resource_name

      extend CronHelpers::Validators

      property :cookbook, String, default: 'cron', desired_state: false
      property :predefined_value, [String, nil], default: nil, callbacks: {
        'should be a valid predefined value' => ->(spec) { validate_predefined_value(spec) }
      }
      property :minute, [Integer, String], default: '*', callbacks: {
        'should be a valid minute spec' => ->(spec) { validate_numeric(spec, 0, 59) }
      }
      property :hour, [Integer, String], default: '*', callbacks: {
        'should be a valid hour spec' => ->(spec) { validate_numeric(spec, 0, 23) }
      }
      property :day, [Integer, String], default: '*', callbacks: {
        'should be a valid day spec' => ->(spec) { validate_numeric(spec, 1, 31) }
      }
      property :month, [Integer, String], default: '*', callbacks: {
        'should be a valid month spec' => ->(spec) { validate_month(spec) }
      }
      property :weekday, [Integer, String], default: '*', callbacks: {
        'should be a valid weekday spec' => ->(spec) { validate_dow(spec) }
      }
      property :command, String, required: true
      property :user, String, default: 'root'
      property :mailto, [String, nil]
      property :path, [String, nil]
      property :home, [String, nil]
      property :shell, [String, nil]
      property :comment, [String, nil]
      property :environment, Hash, default: {}
      property :mode, [String, Integer], default: '0644'

      default_action :create

      action :create do
        # We should be able to switch emulate_cron.d on for Solaris, but I don't have a Solaris box to verify
        raise 'Solaris does not support cron jobs in /etc/cron.d' if node['platform_family'] == 'solaris2'

        create_template(:create)
      end

      action :create_if_missing do
        create_template(:create_if_missing)
      end

      action :delete do
        file "/etc/cron.d/#{sanitized_name}" do
          action :delete
          notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
        end
      end

      @action_class.class_eval do
        def sanitized_name
          name.tr('.', '-')
        end

        def create_template(create_action)
          template "/etc/cron.d/#{sanitized_name}" do
            cookbook new_resource.cookbook
            source 'cron.d.erb'
            mode new_resource.mode
            variables(
              name: sanitized_name,
              predefined_value: predefined_value,
              minute: minute,
              hour: hour,
              day: day,
              month: month,
              weekday: weekday,
              command: command,
              user: new_resource.user,
              mailto: mailto,
              path: new_resource.path,
              home: home,
              shell: shell,
              comment: comment,
              environment: environment
            )
            action create_action
            notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
          end
        end
      end
    end
  end
end
