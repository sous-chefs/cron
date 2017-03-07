#
# Cookbook:: cron
# Library:: matchers
#
# Copyright:: 2016-2017, Chef Software, Inc.
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

if defined?(ChefSpec)
  ChefSpec.define_matcher :cron_d

  def create_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :create, resource_name)
  end

  def create_if_missing_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :create_if_missing, resource_name)
  end

  def delete_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :delete, resource_name)
  end
end
