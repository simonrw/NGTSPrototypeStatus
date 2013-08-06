class RemoveActions < ActiveRecord::Migration
  def change
      drop_table :actions
  end
end
