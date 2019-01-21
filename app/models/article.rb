class Article
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title, type: String
  field :text, type: String

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  def as_indexed_json(options={})
    as_json(only: [:title, :text])
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'russian'
      indexes :text, analyzer: 'russian'

    end
  end
 
  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 5..2000 }

end
