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
    ammo_consumed_per_shot { 1 }
  end
end
