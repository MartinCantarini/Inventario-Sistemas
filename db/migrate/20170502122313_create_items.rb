class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :purchase, foreign_key: true
      t.references :model, foreign_key: true
      t.integer :cantidad_pedidas
      t.integer :cantidad_servidas, default: 0
      t.timestamps
    end
  end
end
