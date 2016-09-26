class User < ApplicationRecord
  has_secure_password
  has_many :job_posts
  has_one :profile
  has_many :job_applications
  has_many :reviews
  has_many :chat_rooms
  has_many :messages
  mount_uploader :image_url, ImageUploader
  geocoded_by :address   # can also be an IP address
after_validation :geocode          # auto-fetch coordinates

  # attr_accessor :image
# has_many :applications, class_name: 'JobApplication', foreign_key: 'applier_id'

validates :first_name, length: { minimum: 2 }
validates :last_name, length: { minimum: 2 }
validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
validates :password, :presence => true,
:confirmation => true,
:length => {:within => 6..40}
validates :user_type, :presence=>true

end