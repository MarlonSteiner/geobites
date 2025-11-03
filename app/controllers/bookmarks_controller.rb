class BookmarksController < ApplicationController
  # Makes sure only logged in users can add bookmarks and create + destroy
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  # https://medium.com/@tmtushar28/build-a-bookmark-app-in-rails-from-scratch-part-1-b9455b72a70b
  # We are able to have a database specific to every user thanks to Devise. And we pass the data from output to bookmark which is all the data we need.
  def index
    @bookmarks = current_user.bookmarks.includes(:output)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = current_user.bookmarks.create(output_id: params[:output_id])
    # Ajax doesn't need a reply with this line. Otherwise render json.
    head :ok
  end

  def destroy
    current_user.bookmarks.find(params[:id]).destroy
    # Only return OK without redirecting me
    head :ok
  end
  # Keep information from being accidentally accessible. Standardard practice also found in LeWagon docs.
  private

  def bookmark_params
    params.require(:bookmark).permit(:output_id)
  end
end
