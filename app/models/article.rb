class Article < ApplicationRecord
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  field :images, type: Object
  has_many_attached :images
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 50..2000 }
end
