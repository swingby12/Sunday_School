class SsInstructor < ActiveRecord::Base
  attr_accessible :user_id, :class_id
  belongs_to :user
  belongs_to :ss_class

  validates :user_id,
            :presence => true

  validates :class_id,
            :presence => true
end
