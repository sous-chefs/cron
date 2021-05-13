#
# Cookbook:: cron
# Resource:: service
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

include ::Cron::Cookbook::Helpers

property :service_name, String,
          default: lazy { default_cron_service }

action_class do
  def do_service_action(action)
    service new_resource.service_name do
      action action
    end
  end
end

%i(start stop reload restart disable enable).each { |action_type| send(:action, action_type) { do_service_action(action) } }
