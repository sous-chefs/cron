# check packages and services on RHEL/Debian families

puts "The OS family is #{os[:family]}"
puts "The OS release is #{os[:release]}"
puts "The OS name is #{os[:name]}"

if %w(debian ubuntu fedora redhat).include?(os[:family])
  if %w(redhat fedora).include?(os[:family])
    service_name = 'crond'
    package_name = 'cronie'

    # RHEL 7+ check
    unless os[:name] == 'amazon' && os[:release].to_i >= 6
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

# make sure the :create_if_missing didn't overwrite the :create
describe file('/etc/cron.d/test-weekday-usage-report') do
  its(:content) { should match(/\/srv\/app\/scripts\/generate_report/) }
end
describe file('/etc/cron.d/nil_value_check') do
  its(:content) { should match(/\* \* \* \* \* appuser \/bin\/true/) }
end
describe file('/etc/cron.d/delete_cron') do
  it { should_not exist }
end
describe file('/etc/cron.d/job-with-periods') do
  it { should exist }
end
describe file('/etc/cron.d/with_random_delay') do
  its(:content) { should match(/RANDOM_DELAY=60/) }
end

# we created this in the test recipe and the provider should clean it up
describe file('/etc/cron.d/job.with.periods') do
  it { should_not exist }
end

describe file('/etc/cron.allow') do
  its('content') { should match /alice/ }
end
