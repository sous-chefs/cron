require 'spec_helper'

describe 'test::default' do
  step_into %i(cron_access cron_d cron_package cron_service)
  platform 'centos'

  it 'enables and starts service[cron]' do
    expect(chef_run).to enable_service('crond')
    expect(chef_run).to start_service('crond')
  end

  it 'creates cron_d[bizarrely-scheduled-usage-report]' do
    expect(chef_run).to create_cron_d('bizarrely-scheduled-usage-report').with(
      minute: '*/5',
      hour: '1,23',
      day: '2-5',
      command: '/srv/app/scripts/generate_report',
      user: 'appuser'
    )
  end

  it 'creates cron_d[test-month-usage-report]' do
    expect(chef_run).to create_cron_d('test-month-usage-report').with(
      minute: '0',
      hour: '6',
      month: '1',
      command: '/srv/app/scripts/generate_report',
      user: 'appuser'
    )
  end

  it 'creates cron_d[fixnum-job]' do
    expect(chef_run).to create_cron_d('fixnum-job').with(
      minute: 0,
      hour: 1,
      day: 2,
      command: '/bin/true',
      user: 'appuser'
    )
  end

  it 'creates cron_d[predefined_value_check]' do
    expect(chef_run).to create_cron_d('predefined_value_check').with(
      predefined_value: '@midnight',
      command: '/bin/true',
      user: 'appuser'
    )
  end

  it 'creates cron_d[nil_value_check]' do
    expect(chef_run).to create_cron_d('nil_value_check').with(
      predefined_value: nil,
      command: '/bin/true',
      user: 'appuser'
    )
  end

  it 'creates if missing cron_d[no_value_check]' do
    expect(chef_run).to create_if_missing_cron_d('no_value_check').with(
      command: '/bin/true',
      user: 'appuser'
    )
  end

  it 'creates file[/etc/cron.d/delete_cron]' do
    expect(chef_run).to create_file('/etc/cron.d/delete_cron')
  end

  it 'deletes cron_d[delete_cron]' do
    expect(chef_run).to delete_cron_d('delete_cron')
  end
end
