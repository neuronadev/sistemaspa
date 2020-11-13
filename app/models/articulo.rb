class Articulo < ApplicationRecord
  belongs_to :revista
  belongs_to :actividad
end
