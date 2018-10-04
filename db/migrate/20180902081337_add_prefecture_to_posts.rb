class AddPrefectureToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :prefecture, :string
  end
end
