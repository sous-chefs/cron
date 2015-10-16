require 'spec_helper'

# check packages and services on RHEL/Debian families
if %w(debian ubuntu fedora redhat).include?(os[:family])
  if %w(redhat fedora).include?(os[:family])
    if os[:release].to_i >= 6
      service_name = 'crond'
      package_name = 'cronie'
    else
      service_name = 'crond'
      package_name = 'vixie-cron'
    end
  elsif %w(debian ubuntu).include?(os[:family])
    service_name = 'cron'
    package_name = 'cron'
  end

  describe service(service_name) do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe package(package_name) do
    it { is_expected.to be_installed }
  end
end

if os[:family] == 'freebsd'
  describe file('/etc/crontab') do
    its(:content) { is_expected.to match /\* \* \* \* \* appuser \/bin\/true/ }
    its(:content) { is_expected.to match /0 1 2 \* \* appuser \/bin\/true/ }
    its(:content) { is_expected.to match /\@midnight appuser \/bin\/true/ }

    its(:content) do
      is_expected.to match /\*\/5 1,23 2-5 \* \* appuser \/srv\/app\/scripts\/generate_report/
    end

    its(:content) do
      is_expected.to match /0 6 \* 1 \* appuser \/srv\/app\/scripts\/generate_report/
    end

    its(:content) do
      is_expected.to match /45 13 \* \* 7 appuser \/srv\/app\/scripts\/generate_report/
    end
  end
else
  describe file('/etc/cron.d/bizarrely-scheduled-usage-report') do
    its(:content) do
      is_expected.to match /\*\/5 1,23 2-5 \* \* appuser \/srv\/app\/scripts\/generate_report/
    end
  end

  describe file('/etc/cron.d/test-month-usage-report') do
    its(:content) do
      is_expected.to match /0 6 \* 1 \* appuser \/srv\/app\/scripts\/generate_report/
    end
  end

  describe file('/etc/cron.d/test-weekday-usage-report') do
    # make sure the :create_if_missing didn't overwrite the :create
    its(:content) do
      is_expected.to match /\/srv\/app\/scripts\/generate_report/
    end
  end

  describe file('/etc/cron.d/fixnum-job') do
    its(:content) { is_expected.to match /0 1 2 \* \* appuser \/bin\/true/ }
  end

  describe file('/etc/cron.d/predefined_value_check') do
    its(:content) { is_expected.to match /\@midnight appuser \/bin\/true/ }
  end

  %w(nil_value_check no_value_check).each do |n|
    describe file("/etc/cron.d/#{n}") do
      its(:content) { is_expected.to match /\* \* \* \* \* appuser \/bin\/true/ }
    end
  end
  describe file('/etc/cron.d/delete_cron') do
    it { should_not exist }
  end
  describe file('/etc/cron.d/job-with-periods') do
    it { should exist }
  end
end
