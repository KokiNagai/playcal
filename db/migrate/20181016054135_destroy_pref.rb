class DestroyPref < ActiveRecord::Migration[5.2]
  def change
    drop_table :pref
  end
end
