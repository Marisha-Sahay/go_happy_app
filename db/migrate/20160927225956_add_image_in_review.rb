class AddImageInReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :reviewer_image, :string
    remove_column :chat_rooms, :title, :string
  end
end
