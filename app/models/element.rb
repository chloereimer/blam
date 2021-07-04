module Element
  class Base
    def self.damage_multiplier_against(hitpoint_bar_type)
      self::DAMAGE_MULTIPLIERS_AGAINST[hitpoint_bar_type]
    end
  end

  module CanApplyStatusEffect
    def status_effect_duration_in_seconds
      self::STATUS_EFFECT_DURATION_IN_SECONDS
    end
  end
end
