class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
   add_index :themes, :user_id
   add_index :themes, :created_at
  end
end
