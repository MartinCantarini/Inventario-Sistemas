class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.date :fecha
      t.string :total
      t.string :lugar
      t.integer :cantidad_items, default: 0
      t.attachment :factura
      t.timestamps
    end
  end
end
