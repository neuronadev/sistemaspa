class Autor < ApplicationRecord
  belongs_to :rol
  belongs_to :persona
  belongs_to :actividad

end
