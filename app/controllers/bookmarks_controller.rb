class BookmarksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create]

  # https://medium.com/@tmtushar28/build-a-bookmark-app-in-rails-from-scratch-part-1-b9455b72a70b
  # We are able to have a database specific to every user thanks to Devise. And we pass the data from output to bookmark which is all the data we need
  def index
    @bookmarks = current_user.bookmarks.includes(:output)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = current_user.bookmarks.create(output_id: params[:output_id])
    head :ok
  end

  def destroy
    current_user.bookmarks.find(params[:id]).destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:output_id)
  end
end
