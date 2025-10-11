class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: %i[new create]

  # https://medium.com/@tmtushar28/build-a-bookmark-app-in-rails-from-scratch-part-1-b9455b72a70b
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
  end

  def destroy
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:output_id)
  end
end
