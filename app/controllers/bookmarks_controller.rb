class BookmarksController < ApplicationController
  Tmdb::Api.key(ENV['TMDB_API_KEY'])
  Tmdb::Api.language('fr')
  def new
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @movie = Movie.new
    @list = List.all
  end

  def create
    @lists = List.all
    @moviedb = Tmdb::Movie.detail(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @lists
    @bookmark.movie_id = Bookmark.find(params[:id])
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
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
