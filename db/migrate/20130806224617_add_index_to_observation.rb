class AddIndexToObservation < ActiveRecord::Migration
  def change
      add_index :observations, :night_id
  end
end
