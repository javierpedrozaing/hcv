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

ActiveRecord::Schema.define(version: 20161116032908) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nit",                       limit: 255
    t.string   "tarifa",                    limit: 255
    t.string   "tipo_cuenta",               limit: 255
    t.integer  "numero_cuenta",             limit: 4
    t.string   "banco",                     limit: 255
    t.string   "tipo_negociacion",          limit: 255
    t.integer  "id_persona",                limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "eventos_salud_ocupacional", limit: 4
    t.integer  "eventos_medicina_laboral",  limit: 4
  end

  create_table "medicos", force: :cascade do |t|
    t.string   "tipo_consulta",           limit: 255
    t.integer  "consultorio_id",          limit: 4
    t.string   "tipo_contrato",           limit: 255
    t.string   "actividad_economica",     limit: 255
    t.string   "banco",                   limit: 255
    t.string   "tipo_cuenta",             limit: 255
    t.integer  "numero_cuenta",           limit: 4
    t.string   "tarifa",                  limit: 255
    t.integer  "horas_salud_ocupacional", limit: 4
    t.integer  "horas_medicina_laboral",  limit: 4
    t.boolean  "activo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "persona_id",              limit: 4
  end

  add_index "medicos", ["persona_id"], name: "index_medicos_on_persona_id", using: :btree

  create_table "pacientes", force: :cascade do |t|
    t.string   "hora_ingreso",   limit: 255
    t.string   "ciudad_ingreso", limit: 255
    t.string   "tipo_examen",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "persona_id",     limit: 4
  end

  add_index "pacientes", ["persona_id"], name: "index_pacientes_on_persona_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.string   "nombre",                 limit: 255
    t.string   "apellidos",              limit: 255
    t.integer  "edad",                   limit: 4
    t.string   "genero",                 limit: 255
    t.string   "direccion",              limit: 255
    t.string   "telefono",               limit: 255
    t.integer  "celular",                limit: 4
    t.string   "estado_civil",           limit: 255
    t.date     "fecha_nacimiento"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "documento",              limit: 4
    t.string   "tipo_documento",         limit: 255
    t.string   "email_2",                limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "personas", ["email"], name: "index_personas_on_email", unique: true, using: :btree
  add_index "personas", ["reset_password_token"], name: "index_personas_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "medicos", "personas"
  add_foreign_key "pacientes", "personas"
end
