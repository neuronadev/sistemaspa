class Articulo < ApplicationRecord
  belongs_to :revista
  belongs_to :actividad

  validates :fechapub, presence: true
  validates :volumen, presence: true
  validates :revista_id, presence: true


end
