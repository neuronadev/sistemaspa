class Producto < ApplicationRecord

  before_save :default_values

  validates :descripcion, presence:true
  validates :descripcioncorta, presence:true
  validates :puntaje, presence:true
  validates :prodcategoria_id, presence:true
  validates :prodgrupo_id, presence:true

  has_many :actividad

  belongs_to :prodcategoria
  belongs_to :prodgrupo

  def default_values
     self.estado ||= 'A'
  end

end
