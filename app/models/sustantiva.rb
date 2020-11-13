class Sustantiva < ApplicationRecord
  belongs_to :academico
  before_save :default_values
 
  validates :descripcion, presence: true
  validates :investigadorid, presence: true
  validates :porcentaje, presence: true

  def default_values
    self.estado ||= 'A'
  end  

end
