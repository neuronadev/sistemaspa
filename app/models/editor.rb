class Editor < ApplicationRecord
  belongs_to :actividad
  belongs_to :idioma
  belongs_to :ambito

  validates :tipoeditorid, :medio, :codigo, :editorial, :pais, presence: true

end
