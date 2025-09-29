require "test_helper"

class BookmarkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookmark_index_url
    assert_response :success
  end
end
