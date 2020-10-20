class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :photo
  validates_size_of :photo, maximum: 100.kilobytes, message: "should be less than 100KB"
end
