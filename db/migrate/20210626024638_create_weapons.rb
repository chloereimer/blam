class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :item_score
      t.integer :level_requirement
      t.string :rarity
      t.float :damage_per_projectile
      t.float :number_of_projectiles
      t.float :accuracy
      t.float :handling
      t.float :reload_time
      t.float :fire_rate
      t.float :magazine_size
      t.float :ammo_consumed_per_shot

      t.timestamps
    end
  end
end
