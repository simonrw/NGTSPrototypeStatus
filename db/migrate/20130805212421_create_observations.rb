class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :observation_number
      t.integer :night_id
      t.text :log

      t.timestamps
    end
  end
end
