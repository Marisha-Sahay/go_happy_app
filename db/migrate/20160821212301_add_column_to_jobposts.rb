class AddColumnToJobposts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :birthdate, :date
    add_column :job_posts, :days, :string
    add_column :job_posts, :user_id, :integer
    add_column :job_posts, :desired_enrollment_date, :date
    remove_column :job_posts, :type_of_job, :string

  end
end