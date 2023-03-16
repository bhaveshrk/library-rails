json.extract! loaned_book, :id, :user_id, :book_id, :loaned_date, :due_date, :returned_date, :status, :created_at, :updated_at
json.url loaned_book_url(loaned_book, format: :json)
