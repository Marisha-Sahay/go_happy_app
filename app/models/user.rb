class User < ApplicationRecord
has_secure_password
has_many :job_posts
# has_many :job_applications
# has_many :appliers, class_name => 'job_applications', :foreign_key=>'applier_id'
validates :first_name, length: { minimum: 2 }
validates :last_name, length: { minimum: 2 }
validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 6..40}
validates :user_type, :presence=>true
end
