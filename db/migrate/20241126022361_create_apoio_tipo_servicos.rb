class CreateApoioTipoServicos < ActiveRecord::Migration[7.1]
  def change
    create_table :apoio_tipo_servicos do |t|
      t.references :apoio, null: false, foreign_key: true
      t.references :tipo_servico, null: false, foreign_key: true
      t.text :descricao_detalhada

      t.timestamps
    end
  end
end
