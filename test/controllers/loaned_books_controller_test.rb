require "test_helper"

class LoanedBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loaned_book = loaned_books(:one)
  end

  test "should get index" do
    get loaned_books_url
    assert_response :success
  end

  test "should get new" do
    get new_loaned_book_url
    assert_response :success
  end

  test "should create loaned_book" do
    assert_difference("LoanedBook.count") do
      post loaned_books_url, params: { loaned_book: { book_id: @loaned_book.book_id, due_date: @loaned_book.due_date, loaned_date: @loaned_book.loaned_date, returned_date: @loaned_book.returned_date, status: @loaned_book.status, user_id: @loaned_book.user_id } }
    end

    assert_redirected_to loaned_book_url(LoanedBook.last)
  end

  test "should show loaned_book" do
    get loaned_book_url(@loaned_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_loaned_book_url(@loaned_book)
    assert_response :success
  end

  test "should update loaned_book" do
    patch loaned_book_url(@loaned_book), params: { loaned_book: { book_id: @loaned_book.book_id, due_date: @loaned_book.due_date, loaned_date: @loaned_book.loaned_date, returned_date: @loaned_book.returned_date, status: @loaned_book.status, user_id: @loaned_book.user_id } }
    assert_redirected_to loaned_book_url(@loaned_book)
  end

  test "should destroy loaned_book" do
    assert_difference("LoanedBook.count", -1) do
      delete loaned_book_url(@loaned_book)
    end

    assert_redirected_to loaned_books_url
  end
end
