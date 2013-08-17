class AddIndexToMeasurement < ActiveRecord::Migration
  def change
      add_index :measurements, :observation_id
  end
end
