class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :profile
      t.boolean :cpr
      t.boolean :firstaid
      t.string :salary
      t.datetime :availability

      t.timestamps
    end
  end
end
