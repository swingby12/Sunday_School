class User < ActiveRecord::Base
  attr_accessible
  has_many :accesses, foregin_key:"user_id", dependent: :destroy
  has_many :ss_classes, through: :ss_instructors, source: :ss_class
  #has_many :ss_classes, through: :ss_class_sessions, source: :ss_class
  has_many :sessions, through: :ss_attendances, source: :ss_class_session
  has_many :ss_class_sessions, foregin_key:"instructor_id", dependent: :destroy

end
