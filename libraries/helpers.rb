module CronHelpers
  module Validators
    def validate_predefined_value(spec)
      return true if spec.nil?

      # Several special predefined values can substitute in the cron expression
      %w(@reboot @yearly @annually @monthly @weekly @daily @midnight @hourly).include? spec.downcase
    end

    def validate_numeric(spec, min, max)
      #  binding.pry
      return spec >= min && spec <= max if spec.is_a? Fixnum

      # Lists of invidual values, ranges, and step values all share the validity range for type
      spec.split(%r{\/|-|,}).each do |x|
        next if x == '*'

        if x =~ /^\d+$/
          x = x.to_i
          return x >= min && x <= max
        end
      end

      true
    end

    def validate_month(spec)
      if spec.class == Fixnum
        validate_numeric(spec, 1, 12)
      elsif spec.class == String
        return true if spec == '*'
        # Named abbreviations are permitted but not as part of a range or with stepping
        return true if %w(jan feb mar apr may jun jul aug sep oct nov dec).include? spec.downcase
        # 1-12 are legal for months
        validate_numeric(spec, 1, 12)
      else
        false
      end
    end

    def validate_dow(spec)
      if spec.class == Fixnum
        validate_numeric(spec, 0, 7)
      elsif spec.class == String
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
