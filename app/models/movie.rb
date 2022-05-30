class Movie < ApplicationRecord
  has_many :bookmarks
  validates :movie_api_id, uniqueness: true
  # validates :title, :overview, presence: true
end
