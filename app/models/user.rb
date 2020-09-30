class User < ApplicationRecord
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bids, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :strikes, dependent: :destroy
  has_one_attached :photo
  has_many_attached :documents
end
