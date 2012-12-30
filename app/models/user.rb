class User < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :permissions,
           :foreign_key => "user_id",
           :dependent => :destroy
  has_many :ss_instructors,
           :dependent => :destroy
  has_many :ss_classes,
           :through => :ss_instructors,
           :source => :ss_class,
           :dependent => :destroy
  #has_many :ss_classes, through: :ss_class_sessions, source: :ss_class
  has_many :ss_attendances,
           :dependent => :destroy
  has_many :sessions,
           :through => :ss_attendances,
           :source => :ss_class_session
  has_many :ss_class_sessions,
           :foreign_key => "instructor_id",
           :dependent => :nullify

  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            :presence => true,
            :format => {:with => VALID_EMAIL_REGEX},
            :uniqueness => {:case_sensitive => false}

  validates :name_first,
            :length => {:maximum => 15, :minimum => 2},
            :presence => true

  validates :name_last,
            :length => {:maximum => 15, :minimum => 2},
            :presence => true

  validates :password,
            :presence => true,
            :length => { minimum: 6 }

  validates :password_confirmation,
            :presence => true

  def name
    [name_first, name_last].join(' ')
  end
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
