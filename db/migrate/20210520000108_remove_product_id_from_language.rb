class RemoveProductIdFromLanguage < ActiveRecord::Migration[6.0]
  def change
    remove_column :languages, :product_id, :integer
  end
end
