class SsClassSessionNote < ActiveRecord::Base
  attr_accessible :ss_class_session_id, :file
  belongs_to :ss_class_session

  has_attached_file :file

  #validates :name, presence: true
  validates :ss_class_session_id,
            :presence => true
  validates_attachment :file,
                       :presence => true
  #validates_attachment_content_type :file,
  #                                  :content_type => [
  #                                      'application/pdf',
  #                                      'application/msword',
  #                                      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  #                                  ]
  validates_attachment_size :file,
                            :less_than => 10.megabytes

end
