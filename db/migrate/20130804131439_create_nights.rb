class CreateNights < ActiveRecord::Migration
  def change
    create_table :nights do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
