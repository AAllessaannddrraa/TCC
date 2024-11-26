class ApoioTipoServico < ApplicationRecord
  belongs_to :apoio
  belongs_to :tipo_servico
end
