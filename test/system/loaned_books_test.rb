require "application_system_test_case"

class LoanedBooksTest < ApplicationSystemTestCase
  setup do
    @loaned_book = loaned_books(:one)
  end

  test "visiting the index" do
    visit loaned_books_url
    assert_selector "h1", text: "Loaned books"
  end

  test "should create loaned book" do
    visit loaned_books_url
    click_on "New loaned book"

    fill_in "Book", with: @loaned_book.book_id
    fill_in "Due date", with: @loaned_book.due_date
    fill_in "Loaned date", with: @loaned_book.loaned_date
    fill_in "Returned date", with: @loaned_book.returned_date
    fill_in "Status", with: @loaned_book.status
    fill_in "User", with: @loaned_book.user_id
    click_on "Create Loaned book"

    assert_text "Loaned book was successfully created"
    click_on "Back"
  end

  test "should update Loaned book" do
    visit loaned_book_url(@loaned_book)
    click_on "Edit this loaned book", match: :first

    fill_in "Book", with: @loaned_book.book_id
    fill_in "Due date", with: @loaned_book.due_date
    fill_in "Loaned date", with: @loaned_book.loaned_date
    fill_in "Returned date", with: @loaned_book.returned_date
    fill_in "Status", with: @loaned_book.status
    fill_in "User", with: @loaned_book.user_id
    click_on "Update Loaned book"

    assert_text "Loaned book was successfully updated"
    click_on "Back"
  end

  test "should destroy Loaned book" do
    visit loaned_book_url(@loaned_book)
    click_on "Destroy this loaned book", match: :first

    assert_text "Loaned book was successfully destroyed"
  end
end
