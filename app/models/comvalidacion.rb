class Comvalidacion < ApplicationRecord
  self.table_name="val.comvalidaciones"
  belongs_to :comite
  belongs_to :academico

end