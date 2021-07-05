FactoryBot.define do
  factory :weapon do
    name { "Moloko" }
    item_score { 84 }
    level_requirement { 1 }
    rarity { "Common" }
    damage_per_projectile { 11 }
    number_of_projectiles { 1 }
    accuracy { 0.67 }
    handling { 0.57 }
    reload_time { 2.5 }
    fire_rate { 6.95 }
    magazine_size { 16 }

    trait :with_status_effect do
      status_effect_element { Element::Base }
      status_effect_damage { 8 }
      status_effect_chance { 0.19 }
    end
  end
end
