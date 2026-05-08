# frozen_string_literal: true

require 'spec_helper'

describe 'cron_package' do
  step_into :cron_package

  context 'on Ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      cron_package 'default'
    end

    it { is_expected.to install_package('cron').with(package_name: 'cron') }
  end

  context 'on AlmaLinux' do
    platform 'almalinux', '9'

    recipe do
      cron_package 'default'
    end

    it { is_expected.to install_package('cron').with(package_name: 'cronie') }
  end

  context 'with custom packages' do
    platform 'ubuntu', '24.04'

    recipe do
      cron_package 'default' do
        packages %w(cron anacron)
      end
    end

    it { is_expected.to install_package('cron').with(package_name: %w(cron anacron)) }
  end
end
