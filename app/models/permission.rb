class Permission < ActiveRecord::Base
  attr_accessible :category, :can_read, :can_write, :user_id

  belongs_to :user

  validates :category,
            :presence => true
  # Need to narrow down the type categories later

  validates :user_id,
            :presence => true

  validates_uniqueness_of :user_id, scope: [:category]
end
