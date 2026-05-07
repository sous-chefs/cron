# frozen_string_literal: true

provides :cron_service
unified_mode true

include ::Cron::Cookbook::Helpers

property :service_name, String,
          default: lazy { default_cron_service }

default_action :start

action_class do
  include ::Cron::Cookbook::Helpers

  def do_service_action(action)
    service new_resource.service_name do
      action action
    end
  end
end

%i(start stop reload restart disable enable).each { |action_type| send(:action, action_type) { do_service_action(action) } }
