class Cron
  class Helpers
    def self.validate_predefined_value(spec)
      # Several special predefined values can substitute in the cron expression
      spec.nil? ||
        %w(
          @reboot
          @yearly
          @annually
          @monthly
          @weekly
          @daily
          @midnight
          @hourly
        ).include?(spec.downcase)
    end

    def self.validate_numeric(spec, min, max)
      return true if spec == '*'
      #  binding.pry
      if spec.respond_to? :to_int
        return false unless spec >= min && spec <= max
        return true
      end

      # Lists of invidual values, ranges, and step values all share the validity range for type
      spec.split(%r{\/|-|,}).each do |x|
        next if x == '*'
        return false unless x =~ /^\d+$/
        x = x.to_i
        return false unless x >= min && x <= max
      end
      true
    end

    def self.validate_month(spec)
      return true if spec == '*'
      if spec.respond_to? :to_int
        validate_numeric(spec, 1, 12)
      elsif spec.respond_to? :to_str
        return true if spec == '*'
        # Named abbreviations are permitted but not as part of a range or with stepping
        return true if %w(jan feb mar apr may jun jul aug sep oct nov dec).include? spec.downcase
        # 1-12 are legal for months
        validate_numeric(spec, 1, 12)
      else
        false
      end
    end

    def self.validate_dow(spec)
      return true if spec == '*'
      if spec.respond_to? :to_int
        validate_numeric(spec, 0, 7)
      elsif spec.respond_to? :to_str
        return true if spec == '*'
        # Named abbreviations are permitted but not as part of a range or with stepping
        return true if %w(sun mon tue wed thu fri sat).include? spec.downcase
        # 0-7 are legal for days of week
        validate_numeric(spec, 0, 7)
      else
        false
      end
    end
  end
end
