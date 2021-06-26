class ValidatesWeaponAttributePresence < ActiveRecord::Migration[6.1]
  def change
    change_column_null :weapons, :name, false
    change_column_null :weapons, :item_score, false
    change_column_null :weapons, :level_requirement, false
    change_column_null :weapons, :rarity, false
    change_column_null :weapons, :damage_per_projectile, false
    change_column_null :weapons, :number_of_projectiles, false
    change_column_null :weapons, :accuracy, false
    change_column_null :weapons, :handling, false
    change_column_null :weapons, :reload_time, false
    change_column_null :weapons, :fire_rate, false
    change_column_null :weapons, :magazine_size, false
    change_column_null :weapons, :ammo_consumed_per_shot, false
  end
end
