class ChangeColumnToProducts < ActiveRecord::Migration[6.0]
    def up
      change_column :products, :name, :string, null:false, limit: 80
      change_column :products, :description,:text,limit:250
    end
    def down
      change_column :products, :name, :string, null:false
      change_column :products, :description,:text
    end
end
