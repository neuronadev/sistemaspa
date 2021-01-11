class Persona < ApplicationRecord
  
  before_save :default_values

  has_one :usuario
  has_one :academico
  belongs_to :tipopersona
  has_many :autores
  has_many :actividades, through: :autores 
  has_many :mensajes

  accepts_nested_attributes_for :academico
  accepts_nested_attributes_for :usuario
  
  
  validates :nombre, presence:true
  validates :paterno, presence:true
  #validates :materno, presence:true
  #validates :email, presence:true, uniqueness: true
  #validates :genero, presence:true
  validates :tipopersona_id, presence:true
  
  def default_values
      self.estado ||= 'A'
      self.orden = 2
  end  


end
