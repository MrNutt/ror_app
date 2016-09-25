class AddRealToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :real, :boolean, default: false
  end
end
