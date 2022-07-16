class BookmarksController < ApplicationController
  Tmdb::Api.key(ENV['TMDB_API_KEY'])
  Tmdb::Api.language('fr')

  before_action :set_bookmark, only: :destroy
  # before_action :set_movie, only: [:create]
  def new
    @bookmark = Bookmark.new
    @movie = Movie.new
    @lists = List.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.create(movie_api_id: params[:movie_id])
    @movie.save!
    @bookmark.movie = @movie
    @bookmark.movie_id = @movie.id
    @lists = List.all
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render
    end
  end

  def show
  end

  def destroy
    @list = List.find(params[:id])
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    if @bookmark.destroy
      redirect_to list_path(@list)
    else
      render :new_list_bookmark
    end
  end

  private

  def bookmark_params
    params.permit(:commen, :list_id, :movie_id)
  end



  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # def set_movie
  #   @movie = Movie.find(params[:id])
  # end
end
