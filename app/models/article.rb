class Article
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include ElasticMyAnalyzer

  field :title, type: String
  field :text, type: String

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  def as_indexed_json(options={})
    as_json(only: [:title, :text])
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :title, analyzer: 'my_analyzer'
      indexes :text, analyzer: 'my_analyzer'
    end
  end
 
  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 5..2000 }
end
