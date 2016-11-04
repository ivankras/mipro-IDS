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

ActiveRecord::Schema.define(version: 20161104123617) do

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

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.string   "email"
    t.integer  "telefono"
    t.integer  "puntos",                 default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "logro_id"
    t.boolean  "admin",                  default: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
