class Divulgacion < ApplicationRecord
  belongs_to :tipodivulgacion
  validates :tipodivulgacion_id, presence: true
end
