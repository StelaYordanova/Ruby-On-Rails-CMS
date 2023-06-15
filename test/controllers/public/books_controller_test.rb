require "test_helper"

class Public::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_books_show_url
    assert_response :success
  end
end
