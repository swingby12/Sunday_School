class SsAttendance < ActiveRecord::Base
  attr_accessible :user_id, :ss_class_session_id
  belongs_to :user
  belongs_to :ss_class_session

  validates :user_id,
            :presence => true

  validates :ss_class_session_id,
            :presence => true

  validates_uniqueness_of :ss_class_session_id,
                          :scope => [:user_id]
end
