class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :theme_id

      t.timestamps
    end
   add_index :posts, :theme_id
   add_index :posts, :created_at
  end
end
