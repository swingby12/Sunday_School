class SsAttendance < ActiveRecord::Base
  attr_accessible :user_id, :session_id
  belongs_to :user
  belongs_to :ss_class_session

  validates :user_id,
            :presence => true

  validates :session_id,
            :presence => true

  validates_uniqueness_of :session_id,
                          :scope => [:user_id]
end
