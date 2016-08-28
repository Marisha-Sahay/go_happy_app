class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :review
      t.string :reference
      t.string :gender
      t.string :age
      t.boolean :cpr
      t.boolean :first_aid
      t.boolean :trustline
      t.boolean :comfortable_with_pets
      t.text :description
      t.string :preferred_age_group
      t.string :education
      t.string :languages
      t.string :type_of_job
      t.string :availability
      t.timestamps
    end
  end
end
