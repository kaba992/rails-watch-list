class MoviesController < ApplicationController
  Tmdb::Api.key(ENV['TMDB_API_KEY'])
  Tmdb::Api.language('fr')
  def index
    @lists = List.all
    @upcoming = Tmdb::Movie.now_playing['results']
    @popular = Tmdb::Movie.popular['results']
    @top_rated = Tmdb::Movie.top_rated['results']
  end

  def show
    @moviedetail = Tmdb::Movie.detail(params[:id])
    @casts = Tmdb::Movie.cast(params[:id])
    @trailer = Tmdb::Movie.videos(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])['results']
    @reviews = Tmdb::Movie.reviews(params[:id])['results']
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :movie_id, :movie_api_id)
  end
end
