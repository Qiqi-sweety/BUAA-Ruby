class SetDeliveryRiderNull < ActiveRecord::Migration[7.0]
  def change
    change_column :deliveries, :rider_id , :integer, null:true
  end
end
