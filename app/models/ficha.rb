class Ficha < ApplicationRecord
  belongs_to :actividad
  validates :nommedio, presence: true
end
