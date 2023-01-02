class AddChangeColumnNullToUserEmail < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, :unique => false 
  end
  
  def self.up
    change_column :users, :email, :string, :unique => false
  end

  def self.down
    change_column :users, :email, :string, :unique => false 
  end
end
