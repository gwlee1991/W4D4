class Track < ApplicationRecord
  validates :song, :album_id, presence: true
  validates :album_id, uniqueness: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
end
