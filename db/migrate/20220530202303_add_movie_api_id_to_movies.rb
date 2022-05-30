class AddMovieApiIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :movie_api_id, :integer
  end
end
