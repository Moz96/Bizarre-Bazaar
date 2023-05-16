class RemoveSellerIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :seller_id, :bigint
  end
end
