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

ActiveRecord::Schema.define(version: 20181111144720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advogados", force: :cascade do |t|
    t.string "nome"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "estado"
    t.bigint "advogado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advogado_id"], name: "index_clientes_on_advogado_id"
  end

  add_foreign_key "clientes", "advogados"
end
