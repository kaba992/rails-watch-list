class HomeController < ApplicationController
  Tmdb::Api.key(ENV['TMDB_API_KEY'])
  Tmdb::Api.language('fr')
  def index
    @lists = List.all
    @upcoming = Tmdb::Movie.now_playing['results']
    @popular = Tmdb::Movie.popular['results']
    @top_rated = Tmdb::Movie.top_rated['results']
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @casts = Tmdb::Movie.cast(params[:id])
    @trailer = Tmdb::Movie.videos(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])['results']
    @reviews = Tmdb::Movie.reviews(params[:id])['results']
  end


  private

  def movie_params
    params.require(:movie).permit
  end
end
