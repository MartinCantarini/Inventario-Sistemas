class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :fecha
      t.attachment :file
      t.boolean :finalizado
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
