class AddTermToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :term, :boolean, default: true, null: false
  end
end
