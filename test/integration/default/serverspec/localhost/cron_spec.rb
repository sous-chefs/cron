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
    it { should be_enabled }
    it { should be_running }
  end

  describe package(package_name) do
    it { should be_installed }
  end
end

if os[:family] == 'freebsd'
  describe file('/etc/crontab') do
    its(:content) { should match /\* \* \* \* \* appuser \/bin\/true/ }
  end
else
  # make sure the :create_if_missing didn't overwrite the :create
  describe file('/etc/cron.d/test-weekday-usage-report') do
    its(:content) { should match /\/srv\/app\/scripts\/generate_report/ }
  end
  describe file('/etc/cron.d/nil_value_check') do
    its(:content) { should match /\* \* \* \* \* appuser \/bin\/true/ }
  end
  describe file('/etc/cron.d/delete_cron') do
    it { should_not exist }
  end
  describe file('/etc/cron.d/job-with-periods') do
    it { should exist }
  end

  # we created this in the test recipe and the provider should clean it up
  describe file('/etc/cron.d/job.with.periods') do
    it { should_not exist }
  end
end
