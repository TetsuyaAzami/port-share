class AddIndexToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, %i[user_id product_id], unique: true
  end
end
