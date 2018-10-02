class AddMemberToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :member, :string
  end
end
