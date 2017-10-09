apt_update 'update'

include_recipe 'cron'

cron_manage 'alice' do
  action :allow
end

cron_manage 'bob' do
  action :allow
end

cron_manage 'tom' do
  action :allow
end
