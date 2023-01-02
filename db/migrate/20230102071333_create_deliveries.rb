class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.datetime :time
      t.boolean :isFinished
      t.references :order, null: false, foreign_key: true
      t.references :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
