class ChangeColumnsInJobApplication < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_applications, :user_id, :integer 
  end
end
