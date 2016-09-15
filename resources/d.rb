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

def self.validate_predefined_value(spec)
  return true if spec.nil?
  # Several special predefined values can substitute in the cron expression
  if ['@reboot', '@yearly', '@annually', '@monthly', '@weekly', '@daily', '@midnight', '@hourly'].include? spec.downcase
    return true
  else
    return false
  end
end

def self.validate_numeric(spec, min, max)
  #  binding.pry
  if spec.is_a? Fixnum
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

def self.validate_month(spec)
  if spec.class == Fixnum
    return validate_numeric(spec, 1, 12)
  elsif spec.class == String
    return true if spec == '*'
    # Named abbreviations are permitted but not as part of a range or with stepping
    return true if %w(jan feb mar apr may jun jul aug sep oct nov dec).include? spec.downcase
    # 1-12 are legal for months
    return validate_numeric(spec, 1, 12)
  else
    return false
  end
end

def self.validate_dow(spec)
  if spec.class == Fixnum
    return validate_numeric(spec, 0, 7)
  elsif spec.class == String
    return true if spec == '*'
    # Named abbreviations are permitted but not as part of a range or with stepping
    return true if %w(sun mon tue wed thu fri sat).include? spec.downcase
    # 0-7 are legal for days of week
    return validate_numeric(spec, 0, 7)
  else
    return false
  end
end

actions :create, :create_if_missing, :delete
default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :cookbook, kind_of: String, default: 'cron'

attribute :predefined_value, kind_of: [String], default: nil, callbacks: { 'should be a valid predefined value' => ->(spec) { validate_predefined_value(spec) } }
attribute :minute, kind_of: [Integer, String], default: '*', callbacks: { 'should be a valid minute spec' => ->(spec) { validate_numeric(spec, 0, 59) } }
attribute :hour, kind_of: [Integer, String], default: '*', callbacks: { 'should be a valid hour spec' => ->(spec) { validate_numeric(spec, 0, 23) } }
attribute :day, kind_of: [Integer, String], default: '*', callbacks: { 'should be a valid day spec' => ->(spec) { validate_numeric(spec, 1, 31) } }
attribute :month, kind_of: [Integer, String], default: '*', callbacks: { 'should be a valid month spec' => ->(spec) { validate_month(spec) } }
attribute :weekday, kind_of: [Integer, String], default: '*', callbacks: { 'should be a valid weekday spec' => ->(spec) { validate_dow(spec) } }

attribute :command, kind_of: String, required: true
attribute :user, kind_of: String, default: 'root'
attribute :mailto, kind_of: [String, NilClass]
attribute :path, kind_of: [String, NilClass]
attribute :home, kind_of: [String, NilClass]
attribute :shell, kind_of: [String, NilClass]
attribute :comment, kind_of: [String, NilClass]
attribute :environment, kind_of: Hash, default: {}
attribute :mode, kind_of: [String, Integer], default: '0644'
