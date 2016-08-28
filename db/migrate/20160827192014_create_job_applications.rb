class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :applier_id
      t.text :information

      t.timestamps
    end
  end
end
