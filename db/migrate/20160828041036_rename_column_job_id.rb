class RenameColumnJobId < ActiveRecord::Migration[5.0]
  def change
    rename_column :job_applications, :job_id, :job_post_id
  end
end
