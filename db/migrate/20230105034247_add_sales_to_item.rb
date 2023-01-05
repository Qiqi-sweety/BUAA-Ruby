class AddSalesToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :sales, :integer, default: false
  end
end
