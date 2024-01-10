class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :name
      t.string :care
      t.string :years_passed
      t.string :body

      t.timestamps
    end
  end
end
