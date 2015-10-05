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
