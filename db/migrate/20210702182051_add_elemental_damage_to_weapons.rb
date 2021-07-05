class AddElementalDamageToWeapons < ActiveRecord::Migration[6.1]
  def change
    add_column :weapons, :element, :string
    add_column :weapons, :status_effect_element, :string
    add_column :weapons, :status_effect_damage, :float
    add_column :weapons, :status_effect_chance, :float
  end
end
