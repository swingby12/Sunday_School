class SsClassSession < ActiveRecord::Base
  attr_accessible :date, :class_id, :instructor_id, :attendance_tokens
  belongs_to :instructor, :class_name => "User", :foreign_key => :instructor_id
  belongs_to :ss_class, :class_name => "SsClass", :foreign_key => :class_id
  has_many :ss_attendances
  has_many :users,
           :through => :ss_attendances

  attr_reader :attendance_tokens
  def attendance_tokens=(ids)
    self.user_ids = ids.split(",")
  end

  validates :date,
            :presence => true

  validates :class_id,
            :presence => true

  validates :instructor_id,
            :presence => true
end
