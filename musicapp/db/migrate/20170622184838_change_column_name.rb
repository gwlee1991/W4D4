class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :track_id
    add_column :tracks, :album_id, :integer, null: false
    add_index :tracks, :album_id
  end
end
