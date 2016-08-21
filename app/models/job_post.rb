class JobPost < ApplicationRecord
belongs_to :user
has_many :jobapplications
end
