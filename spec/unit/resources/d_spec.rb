# frozen_string_literal: true

require 'spec_helper'

describe 'cron_d' do
  step_into :cron_d
  platform 'ubuntu', '24.04'

  context 'with action :create' do
    recipe do
      cron_d 'daily.usage.report' do
        minute 0
        hour 23
        command '/srv/app/scripts/daily_report'
        user 'appuser'
        environment('APP_ENV' => 'production')
        action :create
      end
    end

    it { is_expected.to delete_file('/etc/cron.d/daily.usage.report') }
    it { is_expected.to create_template('/etc/cron.d/daily-usage-report') }
    it { is_expected.to render_file('/etc/cron.d/daily-usage-report').with_content(%r{0 23 \* \* \* appuser /srv/app/scripts/daily_report}) }
    it { is_expected.to render_file('/etc/cron.d/daily-usage-report').with_content(/^APP_ENV=production$/) }
  end

  context 'with action :create_if_missing' do
    recipe do
      cron_d 'hourly-report' do
        predefined_value '@hourly'
        command '/bin/true'
        user 'appuser'
        action :create_if_missing
      end
    end

    it { is_expected.to create_if_missing_template('/etc/cron.d/hourly-report') }
  end

  context 'with action :delete' do
    recipe do
      cron_d 'daily.usage.report' do
        action :delete
      end
    end

    it { is_expected.to delete_file('/etc/cron.d/daily.usage.report') }
    it { is_expected.to delete_file('/etc/cron.d/daily-usage-report') }
  end
end
