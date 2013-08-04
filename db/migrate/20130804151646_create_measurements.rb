class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :action_id
      t.float :mjd
      t.float :sky_background
      t.float :humidity
      t.float :ambient_temp
      t.float :ccd_temp
      t.float :fwhm

      t.timestamps
    end
  end
end
