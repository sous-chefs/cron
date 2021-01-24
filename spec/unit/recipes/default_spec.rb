require 'spec_helper'

platforms = [
  {
    platform: 'debian',
    version: '10',
    package: 'cron',
  },
  {
    platform: 'ubuntu',
    version: '20.04',
    package: 'cron',
  },
  {
    platform: 'fedora',
    version: '32',
    package: 'cronie',
  },
  {
    platform: 'centos',
    version: '8',
    package: 'cronie',
  },
  {
    platform: 'amazon',
    version: '2',
    package: 'cronie',
  },
  {
    platform: 'opensuse',
    version: '15',
    package: 'cronie',
  },
  {
    platform: 'suse',
    version: '12',
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
