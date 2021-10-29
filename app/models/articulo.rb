class Articulo < ApplicationRecord
  belongs_to :revista
  belongs_to :actividad

  #validates :fechapub, presence: true
  validates :volumen, :pgini, :pgfin, :abstract, presence: true, if: Proc.new { |a| [1,2,3,4,5].include? a.actividad.producto_id  }
  validates :revista_id, presence: true

end