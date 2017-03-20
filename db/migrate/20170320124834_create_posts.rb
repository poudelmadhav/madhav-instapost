class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :photo
      t.text :description
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
