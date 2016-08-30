class AddRemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_applications, :poster_id, :integer 
    remove_column :profiles, :name, :string
    remove_column :profiles, :review, :string
    remove_column :profiles, :reference, :string
    change_column :job_posts, :time, :string
  end
end
