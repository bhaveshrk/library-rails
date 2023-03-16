class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamp :created_at
      # t.timestamps
    end
  end
end
