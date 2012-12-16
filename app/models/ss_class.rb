class SsClass < ActiveRecord::Base
  belongs_to :bible
  has_many :ss_class_sessions, foreign_key :"class_id", dependent :destroy
  has_many :instructors, through :ss_instructor, source :user
end
