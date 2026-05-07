# frozen_string_literal: true

provides :cron_access
provides :cron_manage
unified_mode true

property :user, String,
          name_property: true

default_action :deny

action :allow do
  with_run_context :root do
    edit_resource(:template, '/etc/cron.allow') do |new_resource|
      source 'cron_manage.erb'
      cookbook 'cron'

      mode '0660'

      variables['users'] ||= []
      variables['users'] << new_resource.user

      action :nothing
      delayed_action :create
    end
  end
end

action :deny do
  with_run_context :root do
    edit_resource(:template, '/etc/cron.deny') do |new_resource|
      source 'cron_manage.erb'
      cookbook 'cron'

      mode '0660'

      variables['users'] ||= []
      variables['users'] << new_resource.user

      action :nothing
      delayed_action :create
    end
  end
end
