class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|   	
      t.integer :post_id
      t.integer :user_id
      t.text :text
      t.timestamps
    end
    add_index :comments, [:user_id, :post_id]
	add_index :comments, :post_id
  end
end
