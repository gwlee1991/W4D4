class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :track_id, null: false
      t.string :song, null: false
      t.text :lyrics
      t.timestamps
    end

    add_index :tracks, :track_id
  end
end
