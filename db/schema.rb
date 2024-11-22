# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_19_220631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.text "message", null: false
    t.string "status", default: "unread"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_notifications_on_usuario_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "solicitation_id", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.string "status", default: "pendente"
    t.string "metodo_pagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitation_id"], name: "index_payments_on_solicitation_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.decimal "preco", precision: 10, scale: 2, null: false
    t.datetime "data_agendamento", precision: nil
    t.bigint "cliente_id", null: false
    t.string "status", default: "pendente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_servicos_on_cliente_id"
  end

  create_table "solicitations", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "servico_id", null: false
    t.string "status", default: "pendente"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_solicitations_on_cliente_id"
    t.index ["servico_id"], name: "index_solicitations_on_servico_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "necessidades"
    t.string "horarios_preferidos"
    t.string "tipo_suporte"
    t.text "especializacoes"
    t.string "disponibilidade"
    t.text "regioes_atendimento"
    t.string "password_digest"
    t.string "otp_secret"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "notifications", "usuarios"
  add_foreign_key "payments", "solicitations"
  add_foreign_key "servicos", "usuarios", column: "cliente_id"
  add_foreign_key "solicitations", "servicos"
  add_foreign_key "solicitations", "usuarios", column: "cliente_id"
end
