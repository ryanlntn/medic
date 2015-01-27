module Medic
  module Units

    def sample_unit(u)
      return unless u
      camelized = u.to_s.gsub(/_([a-z]*)/){ "#{$1.capitalize}" }
      if HKUnit.respond_to?(:"#{camelized}Unit")
        HKUnit.send(:"#{camelized}Unit")
      else
        HKUnit.unitFromString(u.to_s)
      end
    end

  end
end
