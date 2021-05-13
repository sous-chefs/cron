module Cron
  module Cookbook
    module Helpers
      def default_cron_package
        case node['platform_family']
        when 'debian'
          'cron'
        when 'amazon', 'fedora', 'suse', 'pld', 'rhel'
          'cronie'
        when 'solaris2'
          'core-os'
        else
          []
        end
      end

      def default_cron_service
        if platform_family?('amazon', 'rhel', 'fedora', 'pld')
          'crond'
        else
          'cron'
        end
      end
    end
  end
end
