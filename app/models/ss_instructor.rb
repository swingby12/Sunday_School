class SsInstructor < ActiveRecord::Base
  belongs_to :user
  belongs_to :ss_class
end
