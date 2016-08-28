class JobApplication < ApplicationRecord
# belongs_to :user
# belongs_to :applier, :class_name=>'User', :foreign_key=>'applier_id'
belongs_to :job_post
end
