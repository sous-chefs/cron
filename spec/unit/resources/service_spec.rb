# frozen_string_literal: true

require 'spec_helper'

describe 'cron_service' do
  step_into :cron_service

  context 'on Ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      cron_service 'default' do
        action %i(enable start)
      end
    end

    it { is_expected.to enable_service('cron') }
    it { is_expected.to start_service('cron') }
  end

  context 'on AlmaLinux' do
    platform 'almalinux', '9'

    recipe do
      cron_service 'default' do
        action %i(enable start)
      end
    end

    it { is_expected.to enable_service('crond') }
    it { is_expected.to start_service('crond') }
  end

  context 'with custom service name' do
    platform 'ubuntu', '24.04'

    recipe do
      cron_service 'default' do
        service_name 'custom-cron'
        action :restart
      end
    end

    it { is_expected.to restart_service('custom-cron') }
  end
end
