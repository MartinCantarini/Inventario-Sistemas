class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :orders, foreign_key: true
      t.references :models, foreign_key: true
      t.boolean :entregado, :default => 0
      t.timestamps
    end
  end
end
