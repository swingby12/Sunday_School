class SsAttendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :ss_class_session
end
