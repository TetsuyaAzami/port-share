class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.integer :product_id
      t.string :language
      t.timestamps
    end
  end
end
