class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true, blob: { content_type: :image, size_range: 1..100.kilobytes }
end
