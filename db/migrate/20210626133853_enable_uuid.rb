class EnableUuid < ActiveRecord::Migration[6.1]
  def change
    # Enable pgcrypto to support use of UUID
    enable_extension "pgcrypto"
  end
end
