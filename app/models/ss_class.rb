class SsClass < ActiveRecord::Base
  attr_accessible :quarter, :year, :category, :name, :bible_id, :instructor_tokens

  belongs_to :bible
  has_many :ss_class_sessions,
           :foreign_key => "class_id",
           :dependent => :destroy
  has_many :ss_instructors,
           :foreign_key => "class_id"
  has_many :instructors,
           :through => :ss_instructors,
           :source => :user
  attr_reader :instructor_tokens
  def instructor_tokens=(ids)
    self.instructor_ids = ids.split(",")
  end

  validates :quarter,
            :presence => true,
            :numericality => {  :only_integer => true,
                                :greater_than_or_equal_to => 1,
                                :less_than_or_equal_to => 4
            }

  validates :year,
            :presence => true

  validates :category,
            :presence => true

  validates :name,
            :presence => true

  validates :bible_id,
            :presence => true

end
