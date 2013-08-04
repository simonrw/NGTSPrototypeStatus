class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :action_id
      t.integer :night_id

      t.timestamps
    end
  end
end
