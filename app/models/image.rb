class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :article 
  has_mongoid_attached_file :image,
      :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
      :url => "/system/:attachment/:id/:style",
      :styles => { :small => "200x200>", :medium => "500x500>" }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

end
