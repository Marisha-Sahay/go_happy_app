class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.string :type_of_job
      t.string :salary

      t.timestamps
    end
  end
end
