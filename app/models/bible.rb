class Bible < ActiveRecord::Base
  attr_accessible :name
  has_many :ss_classes

  validates :name,
            :presence => true
end
