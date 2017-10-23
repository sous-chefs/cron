require 'spec_helper'

platforms = [
  {
    platform: 'ubuntu',
    version: '16.04',
    package: 'cron',
  },
  {
    platform: 'centos',
    version: '5.11',
    package: 'vixie-cron',
  },
  {
    platform: 'centos',
    version: '6.7',
    package: 'cronie',
  },
  {
    platform: 'amazon',
    version: '2017.03',
    package: 'cronie',
  },
  {
    platform: 'suse',
    version: '11.4',
    package: 'cron',
  },
  {
    platform: 'suse',
    version: '12.3',
    package: 'cronie',
  },
]

platforms.each do |p|
  describe "cron::default on #{p[:platform]} #{p[:version]}" do
    cached(:chef_run) { ChefSpec::ServerRunner.new(platform: p[:platform], version: p[:version]).converge('cron::default') }

    it 'installs the necessary cron package' do
      expect(chef_run).to install_package(p[:package])
    end
  end
end
