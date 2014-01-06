if defined?(ChefSpec)
	def create_cron_d(name)
		ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :create, name)
	end

	def delete_cron_d(name)
		ChefSpec::Matchers::ResourceMatcher.new(:cron_d, :delete, name)
	end
end