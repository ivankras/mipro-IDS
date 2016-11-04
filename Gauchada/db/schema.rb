# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161104131452) do

  create_table "comentarios", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "respuesta"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "favors", force: :cascade do |t|
    t.string   "titulo"
    t.string   "foto_url"
    t.string   "descripcion"
    t.string   "ciudad"
    t.integer  "id_ofrecimiento_electo"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "logros", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "puntaje_min"
    t.integer  "puntaje_max"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ofrecimientos", force: :cascade do |t|
    t.string   "descripcion"
    t.date     "fecha_limite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "punto_compras", force: :cascade do |t|
    t.integer  "cantidad"
    t.float    "precio_total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "resenas", force: :cascade do |t|
    t.boolean  "cumplido"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

# Could not dump table "usuarios" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
