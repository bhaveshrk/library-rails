class CreateLoanedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :loaned_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.timestamp :loaned_date
      t.timestamp :due_date
      t.timestamp :returned_date
      t.string :status

      t.timestamps
    end
  end
end
