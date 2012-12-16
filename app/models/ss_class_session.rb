class SsClassSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :ss_class
  has_many :users, through: :ss_attendance
end
