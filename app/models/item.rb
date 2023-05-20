class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :name, :price, :description, presence: true
end
