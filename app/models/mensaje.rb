class Mensaje < ApplicationRecord
  belongs_to :actividad
  belongs_to :persona
end
