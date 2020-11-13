class Editor < ApplicationRecord
  belongs_to :actividad
  belongs_to :idioma
  belongs_to :ambito
end
