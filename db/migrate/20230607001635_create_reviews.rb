class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
    　t.string :name,               null: false, default: ""
    　t.string :brewery,            null: false, default: ""
      t.text :location,             null: false, default: ""
      t.integer :hoppy
      t.integer :acidity
      t.integer :sweetness
      t.float :evaluation,          null: false, default: ""
      t.text :comment
      t.timestamps
    end
  end
end
