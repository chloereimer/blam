class Element::Incendiary < Element::Base
  extend Element::CanApplyStatusEffect

  DAMAGE_MULTIPLIERS_AGAINST = {flesh: 1.75, shield: 0.5, armor: 0.5}
  STATUS_EFFECT_DURATION_IN_SECONDS = 5
end
