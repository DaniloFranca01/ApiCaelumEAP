class Registro < ApplicationRecord
  belongs_to :paciente
  belongs_to :escala
  has_many :resultados
  has_many :parametros, through: :resultados
end
