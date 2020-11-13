class Capitulo < ApplicationRecord
  belongs_to :idioma
  belongs_to :libro
  belongs_to :actividad
end
