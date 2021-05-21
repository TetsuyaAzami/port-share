class CreateProductTechniques < ActiveRecord::Migration[6.0]
  def change
    create_table :product_techniques do |t|
      t.integer :product_id,null:false,foreign_key:true
      t.integer :technique_id,null:false,foreign_key:true

      t.timestamps
    end
  end
end
