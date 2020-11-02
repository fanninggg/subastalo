class User < ApplicationRecord
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_save :check_for_completion

  has_many :bids, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :strikes, dependent: :destroy
  has_one_attached :photo
  has_many_attached :documents
  validates :name, :address, :sex, :dob, presence: true

  def check_for_completion
    return if completed?
    fields_complete = %w[name address sex dob].all? { |attr| send(attr).present? }
    update_column('completed', true) if fields_complete && documents.attached?
  end
end
