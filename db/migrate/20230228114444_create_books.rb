class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :published_year
      t.integer :author_id
      t.timestamp :created_at
      t.timestamp :updated_at

      # t.timestamps
    end
  end
end
