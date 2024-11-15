class Comite < ApplicationRecord
  before_save :default_values

  self.table_name="val.comites"
  belongs_to :academico
  belongs_to :catevaluador

  validates :academico_id, presence: true
  validates :catevaluador_id, presence: true

  def default_values
    self.estado ||= 'A'
   end  

  def rol
      return self.catevaluador.clave
  end

end
