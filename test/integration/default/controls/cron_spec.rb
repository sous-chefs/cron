# frozen_string_literal: true

title 'cron default tests'

service_name = %w(redhat fedora amazon).include?(os.family) ? 'crond' : 'cron'
package_name = %w(redhat fedora amazon).include?(os.family) ? 'cronie' : 'cron'

control 'cron-package-01' do
  impact 1.0
  title 'cron package is installed'

  describe package(package_name) do
    it { should be_installed }
  end
end

control 'cron-service-01' do
  impact 1.0
  title 'cron service is enabled and running'

  describe service(service_name) do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'cron-d-01' do
  impact 1.0
  title 'cron_d renders and removes cron.d files'

  describe file('/etc/cron.d/test-weekday-usage-report') do
    its('content') { should match(%r{/srv/app/scripts/generate_report}) }
  end

  describe file('/etc/cron.d/nil_value_check') do
    its('content') { should match(%r{\* \* \* \* \* appuser /bin/true}) }
  end

  describe file('/etc/cron.d/delete_cron') do
    it { should_not exist }
  end

  describe file('/etc/cron.d/job-with-periods') do
    it { should exist }
  end

  describe file('/etc/cron.d/job.with.periods') do
    it { should_not exist }
  end

  describe file('/etc/cron.d/with_random_delay') do
    its('content') { should match(/RANDOM_DELAY=60/) }
  end
end

control 'cron-access-01' do
  impact 1.0
  title 'cron_access manages cron.allow'

  describe file('/etc/cron.allow') do
    its('content') { should match(/^alice$/) }
    its('content') { should match(/^bob$/) }
    its('content') { should match(/^tom$/) }
  end
end
