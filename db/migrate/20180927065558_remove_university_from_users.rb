class RemoveUniversityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :university, :string
  end
end
