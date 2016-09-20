class ChangeColumnNameInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :image, :image_url
    change_column :users, :phone_no, :string

  end
end
