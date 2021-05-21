class RenameLanguageColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products,:language ,:technique
  end
end
