# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170502122313) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cartridges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "estado"
    t.boolean  "original"
    t.date     "fecha_entrada"
    t.date     "fecha_estado"
    t.string   "color"
    t.integer  "cantidad_recargas"
    t.integer  "printer_id"
    t.integer  "model_id"
    t.integer  "brand_id"
    t.integer  "purchase_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["brand_id"], name: "index_cartridges_on_brand_id", using: :btree
    t.index ["model_id"], name: "index_cartridges_on_model_id", using: :btree
    t.index ["printer_id"], name: "index_cartridges_on_printer_id", using: :btree
    t.index ["purchase_id"], name: "index_cartridges_on_purchase_id", using: :btree
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "funcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions_printers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "function_id"
    t.integer "printer_id"
    t.index ["function_id"], name: "index_functions_printers_on_function_id", using: :btree
    t.index ["printer_id"], name: "index_functions_printers_on_printer_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchase_id"
    t.integer  "model_id"
    t.integer  "cantidad_pedidas"
    t.integer  "cantidad_servidas", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["model_id"], name: "index_items_on_model_id", using: :btree
    t.index ["purchase_id"], name: "index_items_on_purchase_id", using: :btree
  end

  create_table "models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre_encargado"
    t.integer  "department_id"
    t.integer  "direction_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["department_id"], name: "index_offices_on_department_id", using: :btree
    t.index ["direction_id"], name: "index_offices_on_direction_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "fecha"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "finalizado"
    t.integer  "office_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["office_id"], name: "index_orders_on_office_id", using: :btree
  end

  create_table "printers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "modelo"
    t.string   "detalles"
    t.boolean  "red_disponible"
    t.string   "numero_inventario"
    t.integer  "brand_id"
    t.integer  "office_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["brand_id"], name: "index_printers_on_brand_id", using: :btree
    t.index ["office_id"], name: "index_printers_on_office_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "orders_id"
    t.integer  "models_id"
    t.boolean  "entregado",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["models_id"], name: "index_products_on_models_id", using: :btree
    t.index ["orders_id"], name: "index_products_on_orders_id", using: :btree
  end

  create_table "pruebas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.integer  "printer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["printer_id"], name: "index_pruebas_on_printer_id", using: :btree
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "fecha"
    t.string   "total"
    t.string   "lugar"
    t.integer  "cantidad_items",       default: 0
    t.string   "factura_file_name"
    t.string   "factura_content_type"
    t.integer  "factura_file_size"
    t.datetime "factura_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "recharges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "detalles"
    t.string   "lugar_recarga"
    t.string   "calle"
    t.string   "telefono"
    t.date     "fecha_recarga_inicio"
    t.date     "fecha_recarga_fin"
    t.integer  "cartridge_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["cartridge_id"], name: "index_recharges_on_cartridge_id", using: :btree
  end

  add_foreign_key "cartridges", "brands"
  add_foreign_key "cartridges", "models"
  add_foreign_key "cartridges", "printers"
  add_foreign_key "cartridges", "purchases"
  add_foreign_key "items", "models"
  add_foreign_key "items", "purchases"
  add_foreign_key "offices", "departments"
  add_foreign_key "offices", "directions"
  add_foreign_key "orders", "offices"
  add_foreign_key "printers", "brands"
  add_foreign_key "printers", "offices"
  add_foreign_key "products", "models", column: "models_id"
  add_foreign_key "products", "orders", column: "orders_id"
  add_foreign_key "pruebas", "printers"
  add_foreign_key "recharges", "cartridges"
end
