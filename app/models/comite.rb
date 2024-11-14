class Comite < ApplicationRecord
  self.table_name="val.comites"
  belongs_to :academico
  belongs_to :catevaluador
end
