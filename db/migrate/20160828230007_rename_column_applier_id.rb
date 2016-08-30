class RenameColumnApplierId < ActiveRecord::Migration[5.0]
  def change
    rename_column :job_applications, :applier_id, :user_id
  end
end
