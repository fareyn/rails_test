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

ActiveRecord::Schema.define(version: 0) do

  create_table "empleados", primary_key: "rfc", id: :string, limit: 13, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "sucursal_id",            null: false
    t.string  "nemp",        limit: 50, null: false
    t.string  "npuesto",     limit: 30, null: false
    t.index ["sucursal_id"], name: "fk_empleado_suc", using: :btree
  end

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "correo",          limit: 30,  null: false
    t.string "rfc",             limit: 13,  null: false
    t.string "nomdueno",        limit: 50,  null: false
    t.string "nombre",          limit: 50,  null: false
    t.string "password_digest", limit: 100
    t.index ["correo"], name: "correo", unique: true, using: :btree
    t.index ["rfc"], name: "rfc", unique: true, using: :btree
  end

  create_table "sucursals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "empresa_id",            null: false
    t.string  "nsuc",       limit: 50, null: false
    t.string  "ncalle",     limit: 30, null: false
    t.string  "ncol",       limit: 30, null: false
    t.integer "numext",                null: false
    t.integer "numint",                null: false
    t.integer "cpost",                 null: false
    t.string  "ciudad",     limit: 30, null: false
    t.string  "pais",       limit: 30, null: false
    t.index ["empresa_id"], name: "fk_emp_suc", using: :btree
  end

  add_foreign_key "empleados", "sucursals", name: "fk_empleado_suc"
  add_foreign_key "sucursals", "empresas", name: "fk_emp_suc"
end
