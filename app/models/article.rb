class Article
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title, type: String
  field :text, type: String

  has_many :images, dependent: :destroy

  def as_indexed_json
    as_json(exept: [:id, :_id])
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
