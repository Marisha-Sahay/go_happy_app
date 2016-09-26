class JobPost < ApplicationRecord
belongs_to :user
has_many :job_applications
validates :title, length: { minimum: 2 }
validates :birthdate, :presence=>true

def timestamp
  updated_at.strftime('%d %B %Y')
end

end
