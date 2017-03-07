#
# Cookbook:: cron
# Resource:: d
#
# Copyright:: 2008-2017, Chef Software, Inc.
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

property :name, String, name_property: true
property :cookbook, String, default: 'cron'

property :predefined_value, [String], callbacks: { 'should be a valid predefined value' => ->(spec) { validate_predefined_value(spec) } }
property :minute, [Integer, String], default: '*', callbacks: { 'should be a valid minute spec' => ->(spec) { validate_numeric(spec, 0, 59) } }
property :hour, [Integer, String], default: '*', callbacks: { 'should be a valid hour spec' => ->(spec) { validate_numeric(spec, 0, 23) } }
property :day, [Integer, String], default: '*', callbacks: { 'should be a valid day spec' => ->(spec) { validate_numeric(spec, 1, 31) } }
property :month, [Integer, String], default: '*', callbacks: { 'should be a valid month spec' => ->(spec) { validate_month(spec) } }
property :weekday, [Integer, String], default: '*', callbacks: { 'should be a valid weekday spec' => ->(spec) { validate_dow(spec) } }

property :command, String, required: true
property :user, String, default: 'root'
property :mailto, [String, NilClass]
property :path, [String, NilClass]
property :home, [String, NilClass]
property :shell, [String, NilClass]
property :comment, [String, NilClass]
property :environment, Hash, default: {}
property :mode, [String, Integer], default: '0644'

action :create do
  # We should be able to switch emulate_cron.d on for Solaris, but I don't have a Solaris box to verify
  raise 'Solaris does not support cron jobs in /etc/cron.d' if node['platform_family'] == 'solaris2'
  create_template(:create)
end

action :create_if_missing do
  create_template(:create_if_missing)
end

action :delete do
  # cleanup the legacy named job if it exists
  file 'legacy named cron.d file' do
    path "/etc/cron.d/#{new_resource.name}"
    action :delete
    notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
  end

  file "/etc/cron.d/#{sanitized_name}" do
    action :delete
    notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
  end
end

action_class do
  def sanitized_name
    new_resource.name.tr('.', '-')
  end

  def create_template(create_action)
    # cleanup the legacy named job if it exists
    file "#{new_resource.name} legacy named cron.d file" do
      path "/etc/cron.d/#{new_resource.name}"
      action :delete
      notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
      only_if { new_resource.name != sanitized_name }
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
        environment: new_resource.environment
      )
      action create_action
      notifies :create, 'template[/etc/crontab]', :delayed if node['cron']['emulate_cron.d']
    end
  end
end

class << self
  def validate_predefined_value(spec)
    return true if spec.nil?
    # Several special predefined values can substitute in the cron expression
    if ['@reboot', '@yearly', '@annually', '@monthly', '@weekly', '@daily', '@midnight', '@hourly'].include? spec.downcase
      return true
    else
      return false
    end
  end

  def validate_numeric(spec, min, max)
    #  binding.pry
    if spec.is_a? Integer
      return false unless spec >= min && spec <= max
      return true
    end

    # Lists of invidual values, ranges, and step values all share the validity range for type
    spec.split(%r{\/|-|,}).each do |x|
      next if x == '*'
      if x =~ /^\d+$/
        x = x.to_i
        return false unless x >= min && x <= max
      else
        return false
      end
    end
    true
  end

  def validate_month(spec)
    if spec.class == Integer
      validate_numeric(spec, 1, 12)
    elsif spec.class == String
      return true if spec == '*'
      # Named abbreviations are permitted but not as part of a range or with stepping
      return true if %w(jan feb mar apr may jun jul aug sep oct nov dec).include? spec.downcase
      # 1-12 are legal for months
      validate_numeric(spec, 1, 12)
    else
      false
    end
  end

  def validate_dow(spec)
    if spec.class == Integer
      validate_numeric(spec, 0, 7)
    elsif spec.class == String
      return true if spec == '*'
      # Named abbreviations are permitted but not as part of a range or with stepping
      return true if %w(sun mon tue wed thu fri sat).include? spec.downcase
      # 0-7 are legal for days of week
      validate_numeric(spec, 0, 7)
    else
      false
    end
  end
end
