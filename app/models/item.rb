class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :price, :description, presence: true
end
