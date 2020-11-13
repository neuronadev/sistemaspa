class Libroarbitrado < ApplicationRecord
  belongs_to :idioma
  belongs_to :editorial
  belongs_to :actividad
end
