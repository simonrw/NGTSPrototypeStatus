class AddColumnsToMeasurement < ActiveRecord::Migration
  def change
      add_column :measurements, :airmass, :float
      add_column :measurements, :tel_ra, :float
      add_column :measurements, :tel_dec, :float
      add_column :measurements, :exposure_time, :float
      add_column :measurements, :moon_distance, :float
      add_column :measurements, :sun_distance, :float
  end
end
