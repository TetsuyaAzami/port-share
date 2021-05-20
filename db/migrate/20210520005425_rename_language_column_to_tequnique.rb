class RenameLanguageColumnToTequnique < ActiveRecord::Migration[6.0]
  def change
    rename_column :techniques,:language,:technique
  end
end
