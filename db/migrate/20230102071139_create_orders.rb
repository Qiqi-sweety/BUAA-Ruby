class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :time
      t.decimal :money
      t.boolean :isProcessed
      t.boolean :isDelivered
      t.references :seller, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
