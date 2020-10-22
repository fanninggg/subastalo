class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :photo, presence: true, blob: { content_type: :image, size_range: 1..100.kilobytes }

  def display_name
    self.name.truncate(20)
  end
end
