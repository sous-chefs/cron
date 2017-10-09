describe file('/etc/cron.allow') do
  its('content') { should match /alice/ }
end
