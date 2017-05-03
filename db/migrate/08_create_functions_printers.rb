class CreateFunctionsPrinters < ActiveRecord::Migration[5.0]
  def change
    create_table :functions_printers, id: false do |t|

      t.belongs_to :function
      t.belongs_to :printer
    end
  end
end
