class Article
  include Mongoid::Document
  field :title, type: String
  field :text, type: String

  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 50..2000 }


end
