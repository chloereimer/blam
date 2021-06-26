class Weapon < ApplicationRecord
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
end
