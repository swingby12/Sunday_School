class SsClassSession < ActiveRecord::Base
  attr_accessible :date, :class_id, :instructor_id
  belongs_to :instructor, :class_name => "User", :foreign_key => :instructor_id
  belongs_to :ss_class
  has_many :ss_attendances
  has_many :users, through: :ss_attendance

  validates :date,
            :presence => true

  validates :class_id,
            :presence => true

  validates :instructor_id,
            :presence => true
end
