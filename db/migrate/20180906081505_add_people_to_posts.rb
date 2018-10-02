class AddPeopleToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :people, :integer
  end
end
