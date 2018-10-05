class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :live, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :picture, :string
    add_column :users, :introduction, :text
  end
end
