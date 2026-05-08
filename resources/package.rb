# frozen_string_literal: true

provides :cron_package
unified_mode true

include ::Cron::Cookbook::Helpers

property :packages, [String, Array],
          default: lazy { default_cron_package }

default_action :install

action_class do
  include ::Cron::Cookbook::Helpers

  def do_package_action(action)
    package 'cron' do
      package_name new_resource.packages
      action action
    end
  end
end

%i(install remove upgrade).each { |action_type| send(:action, action_type) { do_package_action(action) } }
