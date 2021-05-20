class RenameLanguagetoTechnique < ActiveRecord::Migration[6.0]
  def change
    rename_table :languages, :techniques
  end
end
