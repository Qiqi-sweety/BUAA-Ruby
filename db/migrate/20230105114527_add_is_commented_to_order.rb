class AddIsCommentedToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :isCommented, :boolean, :default => false
  end
end
