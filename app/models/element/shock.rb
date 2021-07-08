class Element::Shock < Element::Base
  extend Element::CanApplyStatusEffect

  DAMAGE_MULTIPLIERS_AGAINST = {flesh: 0.65, shield: 2.5, armor: 0.65}
  STATUS_EFFECT_DURATION_IN_SECONDS = 3
end
