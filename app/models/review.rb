class Review < ApplicationRecord
  belongs_to :user

def timestamp
  updated_at.strftime('%d %B %Y')
end
end
