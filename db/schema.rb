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

ActiveRecord::Schema[7.1].define(version: 2024_11_26_171151) do
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

  create_table "apoio_tipo_servicos", force: :cascade do |t|
    t.bigint "apoio_id", null: false
    t.bigint "tipo_servico_id", null: false
    t.text "descricao_detalhada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apoio_id"], name: "index_apoio_tipo_servicos_on_apoio_id"
    t.index ["tipo_servico_id"], name: "index_apoio_tipo_servicos_on_tipo_servico_id"
  end

  create_table "apoios", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "supervisora_id"
    t.text "descricao"
    t.string "status"
    t.date "data_inicio"
    t.date "data_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_apoios_on_cliente_id"
    t.index ["supervisora_id"], name: "index_apoios_on_supervisora_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "numero_contato", null: false
    t.integer "status", default: 0
    t.bigint "responsavel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["numero_contato"], name: "index_clientes_on_numero_contato", unique: true
    t.index ["responsavel_id"], name: "index_clientes_on_responsavel_id"
  end

  create_table "cuidador_treinamentos", force: :cascade do |t|
    t.bigint "cuidador_id", null: false
    t.bigint "treinamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuidador_id"], name: "index_cuidador_treinamentos_on_cuidador_id"
    t.index ["treinamento_id"], name: "index_cuidador_treinamentos_on_treinamento_id"
  end

  create_table "cuidadores", force: :cascade do |t|
    t.string "nome", null: false
    t.string "nif", null: false
    t.string "email", null: false
    t.string "numero_contato", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ativo"
    t.index ["email"], name: "index_cuidadores_on_email", unique: true
    t.index ["nif"], name: "index_cuidadores_on_nif", unique: true
    t.index ["numero_contato"], name: "index_cuidadores_on_numero_contato", unique: true
  end

  create_table "equipamentos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.bigint "apoio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apoio_id"], name: "index_equipamentos_on_apoio_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "cuidador_id", null: false
    t.bigint "cliente_id", null: false
    t.integer "avaliacao"
    t.text "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_feedbacks_on_cliente_id"
    t.index ["cuidador_id"], name: "index_feedbacks_on_cuidador_id"
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

  create_table "relatorios", force: :cascade do |t|
    t.bigint "apoio_id", null: false
    t.text "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apoio_id"], name: "index_relatorios_on_apoio_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.bigint "tipo_servico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cuidador_id"
    t.index ["tipo_servico_id"], name: "index_servicos_on_tipo_servico_id"
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

  create_table "tipo_servicos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_tipo_servicos_on_nome", unique: true
  end

  create_table "treinamentos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.bigint "cuidador_id", null: false
    t.bigint "servico_id", null: false
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuidador_id"], name: "index_turnos_on_cuidador_id"
    t.index ["servico_id"], name: "index_turnos_on_servico_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "papel", default: "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "necessidades"
    t.string "horarios_preferidos"
    t.string "tipo_suporte"
    t.text "especializacoes"
    t.string "disponibilidade"
    t.text "regioes_atendimento"
    t.string "encrypted_password", default: "", null: false
    t.string "otp_secret"
    t.string "role"
    t.integer "status"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apoio_tipo_servicos", "apoios"
  add_foreign_key "apoio_tipo_servicos", "tipo_servicos"
  add_foreign_key "apoios", "usuarios", column: "cliente_id"
  add_foreign_key "apoios", "usuarios", column: "supervisora_id"
  add_foreign_key "clientes", "usuarios", column: "responsavel_id"
  add_foreign_key "cuidador_treinamentos", "cuidadores", column: "cuidador_id"
  add_foreign_key "cuidador_treinamentos", "treinamentos"
  add_foreign_key "equipamentos", "apoios"
  add_foreign_key "feedbacks", "cuidadores", column: "cuidador_id"
  add_foreign_key "feedbacks", "usuarios", column: "cliente_id"
  add_foreign_key "notifications", "usuarios"
  add_foreign_key "payments", "solicitations"
  add_foreign_key "relatorios", "apoios"
  add_foreign_key "servicos", "tipo_servicos"
  add_foreign_key "solicitations", "servicos"
  add_foreign_key "solicitations", "usuarios", column: "cliente_id"
  add_foreign_key "turnos", "cuidadores", column: "cuidador_id"
  add_foreign_key "turnos", "servicos"
end
