class AddUrlToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :url, :string,null: false
  end
end
