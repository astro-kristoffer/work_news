class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :article

  has_mongoid_attached_file :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
