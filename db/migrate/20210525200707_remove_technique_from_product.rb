class RemoveTechniqueFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :technique, :text
  end
end
