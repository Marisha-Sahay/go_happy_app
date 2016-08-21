class RemoveApplicationTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :applications
    add_column :users, :phone_no, :integer
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
  end
end
