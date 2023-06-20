class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name,                 null: false
      t.string :brewery,              null: false
      t.text :location,               null: false
      t.integer :hoppy
      t.integer :acidity
      t.integer :sweetness
      t.float :evaluation,            null: false
      t.text :comment
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end