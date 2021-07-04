class Element::Corrosive < Element::Base
  extend Element::CanApplyStatusEffect

  DAMAGE_MULTIPLIERS_AGAINST = {flesh: 0.65, shield: 0.5, armor: 1.75}
  STATUS_EFFECT_DURATION_IN_SECONDS = 7
end
