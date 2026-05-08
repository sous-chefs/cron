# frozen_string_literal: true

require 'spec_helper'

describe 'cron_access' do
  step_into %i(cron_access cron_manage)
  platform 'ubuntu', '24.04'

  context 'with action :allow' do
    recipe do
      cron_access 'alice' do
        action :allow
      end
    end

    it { is_expected.to create_template('/etc/cron.allow') }
    it { is_expected.to render_file('/etc/cron.allow').with_content(/^alice$/) }
  end

  context 'with action :deny' do
    recipe do
      cron_access 'bob' do
        action :deny
      end
    end

    it { is_expected.to create_template('/etc/cron.deny') }
    it { is_expected.to render_file('/etc/cron.deny').with_content(/^bob$/) }
  end

  context 'with legacy cron_manage alias' do
    recipe do
      cron_manage 'bill' do # rubocop:disable Chef/Modernize/CronManageResource
        action :deny
      end
    end

    it { is_expected.to create_template('/etc/cron.deny') }
    it { is_expected.to render_file('/etc/cron.deny').with_content(/^bill$/) }
  end
end
