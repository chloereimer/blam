class Element::Radiation < Element::Base
  extend Element::CanApplyStatusEffect

  DAMAGE_MULTIPLIERS_AGAINST = {flesh: 1.0, shield: 1.5, armor: 0.5}
  STATUS_EFFECT_DURATION_IN_SECONDS = 8
end
