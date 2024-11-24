# db/migrate/20241123015753_create_cuidadores.rb
class CreateCuidadores < ActiveRecord::Migration[7.1]
  def change
    create_table :cuidadores do |t|
      t.string :nome, null: false
      t.date :data_nascimento
      t.string :genero
      t.string :nif, null: false
      t.string :nic
      t.string :endereco
      t.string :telefone_principal
      t.string :telefone_secundario
      t.string :email, null: false
      t.string :numero_contato, null: false
      t.integer :experiencia
      t.text :especializacoes
      t.text :certificacoes
      t.text :disponibilidade
      t.text :idiomas
      t.text :habilidades
      t.text :tipos_servicos
      t.string :nacionalidade
      t.string :codigo_pais_telefone
      t.string :telefone_emergencia
      t.text :filhos_e_idades
      t.text :formacao
      t.text :certidao_criminal
      t.string :status_selecao
      t.string :gestor_responsavel

      t.timestamps
    end

    add_index :cuidadores, :nif, unique: true
    add_index :cuidadores, :email, unique: true
    add_index :cuidadores, :numero_contato, unique: true
  end
end
