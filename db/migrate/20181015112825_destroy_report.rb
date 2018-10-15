class DestroyReport < ActiveRecord::Migration[5.2]
  def change
    drop_table :report
  end
end
