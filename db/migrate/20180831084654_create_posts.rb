class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :prefecture
      t.integer :skill
      t.integer :member
      t.integer :gender
      t.integer :style
      t.boolean :term, default: true, null: false
      t.date :playday
      t.string :city
      t.string :title
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
