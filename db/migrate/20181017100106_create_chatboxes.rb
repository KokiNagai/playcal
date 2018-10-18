class CreateChatboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :chatboxes do |t|
      t.boolean :touropen, default: true, null: false
      t.timestamps
    end
  end
end
