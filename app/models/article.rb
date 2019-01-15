class Article
  include Mongoid::Document
  include Mongoid::Paperclip


  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  field :title, type: String
  field :text, type: String
  has_mongoid_attached_file :image

  #embeds_many :images, cascade_callbacks: true
  
  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 25..2000 }
  
end