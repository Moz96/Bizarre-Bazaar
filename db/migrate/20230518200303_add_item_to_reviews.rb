class AddItemToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :item, null: false, foreign_key: true
  end
end
