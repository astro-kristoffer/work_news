class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :title, presence: true, length: { in: 5..250 }
  validates :text, presence: true, length: { in: 50..2000 }

end
