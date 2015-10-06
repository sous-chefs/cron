require 'spec_helper'

if %w(redhat fedora).include?(os[:family])
  describe service('crond') do
    it { should be_enabled }
    it { should be_running }
  end
elsif %w(debian ubuntu).include?(os[:family])
  describe service('cron') do
    it { should be_enabled }
    it { should be_running }
  end
end

if %w(redhat fedora).include?(os[:family])
  if os[:release].to_i >= 6
    describe package('cronie') do
      it { should be_installed }
    end
  else
    describe package('vixie-cron') do
      it { should be_installed }
    end
  end
elsif %w(debian ubuntu).include?(os[:family])
  describe package('cron') do
    it { should be_installed }
  end
end

if os[:family] == 'freebsd'
  describe file('/etc/crontab') do
    its(:content) { should match /\* \* \* \* \* appuser \/bin\/true/ }
  end
else
  describe file('/etc/cron.d/nil_value_check') do
    its(:content) { should match /\* \* \* \* \* appuser \/bin\/true/ }
  end
end
