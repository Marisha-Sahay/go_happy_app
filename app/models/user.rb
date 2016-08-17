class User < ApplicationRecord
has_many :job_posts
has_secure_password
end
