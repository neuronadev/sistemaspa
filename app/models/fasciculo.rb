class Fasciculo < ApplicationRecord
  belongs_to :tipofasciculo
  belongs_to :tipomedio
  belongs_to :actividad
end
