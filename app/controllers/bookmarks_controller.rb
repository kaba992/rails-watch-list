class BookmarksController < ApplicationController
  Tmdb::Api.key(ENV['TMDB_API_KEY'])
  Tmdb::Api.language('fr')
  before_action :set_bookmark, only: :destroy
  # before_action :set_movie, only: [:new, :create]
  def new
    @movie = params[:movie_id].to_i
    @bookmark = Bookmark.new(bookmark_params)
    @lists = List.all
  end

  def create
    @lists = List.all
  
    @bookmark.movie_id = @movie
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
    params.permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # def set_movie
  #   @movie = Movie.find(params[:movie_id])
  # end
end
