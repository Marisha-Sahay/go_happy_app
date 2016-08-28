class AddColumnToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :poster_id, :integer
    rename_column :job_applications, :applier, :applier_id
  end
end
