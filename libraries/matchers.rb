if defined?(ChefSpec)
  ChefSpec.define_matcher :cron_d

  def create_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :create, resource_name)
  end

  def create_if_missing_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :create_if_missing, resource_name)
  end

  def delete_cron_d(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :delete, resource_name)
  end
end
