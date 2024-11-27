
class AddAdvancedFieldsToUsuarios < ActiveRecord::Migration[6.1]
  def change
    # For clients
    add_column :usuarios, :necessidades, :text # Example: ['enfermagem', 'fisioterapia']
    add_column :usuarios, :horarios_preferidos, :string # Example: '08:00-12:00'
    add_column :usuarios, :tipo_suporte, :string # Example: 'interno' or 'externo'

    # For caregivers
    add_column :usuarios, :especializacoes, :text # Example: ['mobilidade', 'pediatria']
    add_column :usuarios, :disponibilidade, :string # Example: 'Seg-Sex, 08:00-17:00'
    add_column :usuarios, :regioes_atendimento, :text # Example: ['Lisboa', 'Porto']
  end
end
