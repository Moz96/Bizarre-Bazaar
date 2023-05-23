class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_one_attached :photo
  validates :name, :price, :description, presence: true
  attribute :address, :string
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
