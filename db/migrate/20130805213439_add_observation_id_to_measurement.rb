class AddObservationIdToMeasurement < ActiveRecord::Migration
  def change
      add_column :measurements, :observation_id, :integer
      remove_column :measurements, :action_id
  end
end
