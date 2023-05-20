class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :item
end
