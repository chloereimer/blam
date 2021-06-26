class ConvertWeaponIdToUuid < ActiveRecord::Migration[6.1]
  def up
    add_column :weapons, :uuid, :uuid, null: false
    change_table :weapons do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE weapons ADD PRIMARY KEY (id);"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
