class JobPost < ApplicationRecord
belongs_to :user
has_many :job_applications
validates :title, length: { minimum: 2 }
validates :birthdate, :presence=>true
end
