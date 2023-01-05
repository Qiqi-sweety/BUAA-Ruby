class SetOrderItemNull < ActiveRecord::Migration[7.0]
  def change
    change_column :order_items, :order_id , :integer, null:true
    change_column :order_items, :cart_id , :integer, null:true
  end
end
