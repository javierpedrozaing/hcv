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

ActiveRecord::Schema.define(version: 20161209162038) do

  create_table "cita", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cliente_perfils", force: :cascade do |t|
    t.integer  "id_cliente"
    t.integer  "id_perfil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.integer  "nit"
    t.string   "tarifa"
    t.string   "tipo_cuenta"
    t.integer  "numero_cuenta",             limit: 14
    t.string   "banco"
    t.string   "tipo_negociacion"
    t.string   "eventos_salud_ocupacional"
    t.string   "eventos_medicina_laboral"
    t.integer  "persona_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "servicios"
    t.boolean  "activo"
    t.integer  "citas_asignadas"
    t.integer  "citas_cumplidas"
    t.integer  "perfil_id"
    t.integer  "municipio_id"
  end

  add_index "clientes", ["perfil_id"], name: "index_clientes_on_perfil_id"
  add_index "clientes", ["persona_id"], name: "index_clientes_on_persona_id"

  create_table "consultorios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
  end

  add_index "consultorios", ["cliente_id"], name: "index_consultorios_on_cliente_id"

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especialidads", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados_cita", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medico_especialidads", force: :cascade do |t|
    t.integer  "medico_id"
    t.integer  "especialidad_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "medico_especialidads", ["especialidad_id"], name: "index_medico_especialidads_on_especialidad_id"
  add_index "medico_especialidads", ["medico_id"], name: "index_medico_especialidads_on_medico_id"

  create_table "medicos", force: :cascade do |t|
    t.string   "tipo_contrato"
    t.string   "actividad_economica"
    t.string   "banco"
    t.string   "tipo_cuenta"
    t.integer  "numero_cuenta"
    t.string   "tarifa"
    t.integer  "eventos_salud_ocupacional"
    t.integer  "eventos_medicina_laboral"
    t.boolean  "activo"
    t.integer  "persona_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "cliente_id"
    t.integer  "consultorio_id"
  end

  add_index "medicos", ["cliente_id"], name: "index_medicos_on_cliente_id"
  add_index "medicos", ["consultorio_id"], name: "index_medicos_on_consultorio_id"
  add_index "medicos", ["persona_id"], name: "index_medicos_on_persona_id"

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true

  create_table "municipios", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "municipios", ["departamento_id"], name: "index_municipios_on_departamento_id"

  create_table "perfil_examen", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "perfil_id"
    t.integer  "tipo_examen_id"
  end

  create_table "perfil_examenes", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "perfil_id"
    t.integer  "tipo_examen_id"
  end

  create_table "perfils", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "persona_rols", force: :cascade do |t|
    t.integer  "persona_id"
    t.integer  "rol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombre_completo"
    t.integer  "edad"
    t.string   "genero"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "celular"
    t.string   "estado_civil"
    t.date     "fecha_nacimiento"
    t.string   "lugar_nacimiento"
    t.integer  "documento"
    t.string   "tipo_documento"
    t.string   "email2"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "personas", ["email"], name: "index_personas_on_email", unique: true
  add_index "personas", ["reset_password_token"], name: "index_personas_on_reset_password_token", unique: true

  create_table "rols", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_examenes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nombre"
  end

end
