require 'spec_helper'

platforms = [
  {
    platform: 'debian',
    version: '9.3',
    package: 'cron',
  },
  {
    platform: 'ubuntu',
    version: '16.04',
    package: 'cron',
  },
  {
    platform: 'centos',
    version: '6.9',
    package: 'cronie',
  },
  {
    platform: 'fedora',
    version: '27',
    package: 'cronie',
  },
  {
    platform: 'centos',
    version: '7.4.1708',
    package: 'cronie',
  },
  {
    platform: 'amazon',
    version: '2017.09',
    package: 'cronie',
  },
  {
    platform: 'amazon',
    version: '2',
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
    cached(:chef_run) { ChefSpec::SoloRunner.new(platform: p[:platform], version: p[:version]).converge('cron::default') }

    it 'installs the necessary cron package' do
      expect(chef_run).to install_package(p[:package])
    end
  end
end
