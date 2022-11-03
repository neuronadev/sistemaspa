class Calificacion < ApplicationRecord
  self.table_name = 'mru.calificaciones'
  belongs_to :itemsustantiva
end
