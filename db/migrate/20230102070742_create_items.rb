class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :image
      t.text :content
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
