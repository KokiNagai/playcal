class RemovePeopleFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :people, :integer
  end
end
