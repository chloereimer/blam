class AddDefaultToAmmoConsumedPerShot < ActiveRecord::Migration[6.1]
  def up
    change_column_default :weapons, :ammo_consumed_per_shot, 1
  end

  def down
    change_column_default :weapons, :ammo_consumed_per_shot, nil
  end
end
