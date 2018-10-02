class AddPlaydayToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :playday, :date
  end
end
