require 'csv'

Weapon.destroy_all

CSV.foreach("db/seeds/weapons.csv", headers: true) do |row|
  Weapon.create!({
    name: row["Name"],
    item_score: row["Item Score"],
    level_requirement: row["Level Requirement"],
    rarity: row["Rarity"],
    damage_per_projectile: row["Damage"],
    number_of_projectiles: row["Projectiles"],
    accuracy: row["Accuracy"].delete("%").to_f / 100,
    handling: row["Handling"].delete("%").to_f / 100,
    reload_time: row["Reload Time / Repair Time"].delete("s"),
    fire_rate: row["Fire Rate"].delete("/s"),
    magazine_size: row["Magazine Size / Shots To Break"],
    ammo_consumed_per_shot: row["Ammo Consumed Per Shot"],
    element: "Element::#{row['Element']}",
    status_effect_element: "Element::#{row['Status Effect Element']}",
    status_effect_damage: row["Status Effect Damage Per Second"],
    status_effect_chance: row["Status Effect Chance"].delete("%").to_f / 100
  })
end