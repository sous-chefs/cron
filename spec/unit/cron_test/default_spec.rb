require 'spec_helper'

describe 'cron_test::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge('cron_test::default')
  end

  it 'creates cron_d[bizarrely-scheduled-usage-report]' do
    expect(chef_run).to create_cron_d('bizarrely-scheduled-usage-report').with(
      :minute => '*/5',
      :hour => '1,23',
      :day => '2-5',
      :command => '/srv/app/scripts/generate_report',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[test-month-usage-report]' do
    expect(chef_run).to create_cron_d('test-month-usage-report').with(
      :minute => '0',
      :hour => '6',
      :month => '1',
      :command => '/srv/app/scripts/generate_report',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[test-month-usage-report]' do
    expect(chef_run).to create_cron_d('test-weekday-usage-report').with(
      :minute => '45',
      :hour => '13',
      :weekday => '7',
      :command => '/srv/app/scripts/generate_report',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[fixnum-job]' do
    expect(chef_run).to create_cron_d('fixnum-job').with(
      :minute => 0,
      :hour => 1,
      :day => 2,
      :command => '/bin/true',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[predefined_value_check]' do
    expect(chef_run).to create_cron_d('predefined_value_check').with(
      :predefined_value => '@midnight',
      :command => '/bin/true',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[nil_value_check]' do
    expect(chef_run).to create_cron_d('nil_value_check').with(
      :predefined_value => nil,
      :command => '/bin/true',
      :user => 'appuser'
      )
  end

  it 'creates cron_d[no_value_check]' do
    expect(chef_run).to create_cron_d('no_value_check').with(
      :command => '/bin/true',
      :user => 'appuser'
      )
  end
end
