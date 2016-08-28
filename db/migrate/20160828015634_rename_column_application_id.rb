class RenameColumnApplicationId < ActiveRecord::Migration[5.0]
  def change
    rename_column :job_applications, :applier_id, :applier
  end
end
