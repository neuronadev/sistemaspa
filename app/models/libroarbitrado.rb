class Libroarbitrado < ApplicationRecord
  
  validates :isbn, :nopaginas, presence: true
  
  belongs_to :idioma
  belongs_to :editorial
  belongs_to :actividad
end
