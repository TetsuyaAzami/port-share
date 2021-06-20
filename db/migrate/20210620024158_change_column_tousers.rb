class ChangeColumnTousers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :name, :string, null: false, limit: 50
    change_column :users, :profile, :text, limit: 250
  end
  def down
    change_column :users, :name, :string, null: false
    change_column :users, :profile, :text
  end
end
