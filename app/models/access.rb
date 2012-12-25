class Access < ActiveRecord::Base
  attr_accessible :type, :create, :write, :user_id

  belongs_to :user

  validates :type,
            :presence => true
  # Need to narrow down the type categories later

  validates :create,
            :presence => true

  validates :write,
            :presence => true

  validates :user_id,
            :presence => true
end
