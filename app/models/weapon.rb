class Weapon < ApplicationRecord
  self.implicit_order_column = "created_at"

  attribute :ammo_consumed_per_shot, default: 1

  validates :name, presence: true
  validates :item_score, presence: true
  validates :level_requirement, presence: true
  validates :rarity, presence: true, inclusion: {in: ["Common", "Uncommon", "Rare", "Epic", "Legendary"]}
  validates :damage_per_projectile, presence: true
  validates :number_of_projectiles, presence: true
  validates :accuracy, presence: true
  validates :handling, presence: true
  validates :reload_time, presence: true
  validates :fire_rate, presence: true
  validates :magazine_size, presence: true
  validates :ammo_consumed_per_shot, presence: true

  def shots_per_magazine
    magazine_size / ammo_consumed_per_shot
  end

  def seconds_to_empty_magazine
    shots_per_magazine / fire_rate
  end

  def projectile_damage_per_shot
    damage_per_projectile * number_of_projectiles
  end

  def projectile_damage_per_second_excluding_reload_time
    projectile_damage_per_shot * fire_rate
  end

  def projectile_damage_per_magazine
    projectile_damage_per_shot * shots_per_magazine
  end

  def projectile_damage_per_second_including_reload_time
    projectile_damage_per_magazine / (seconds_to_empty_magazine + reload_time)
  end
end
