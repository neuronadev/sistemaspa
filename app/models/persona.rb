class Persona < ApplicationRecord
  include PgSearch::Model
  include Hashid::Rails
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

  def datosAcademico
       return self.academico
  end

  def nomcompleto
      return  (nombre||'') + ' ' + (paterno||'') + ' ' + (materno||'')
  end

  def apellidonom
     return  (paterno||'') + ' ' + (materno||'') + ' ' + (nombre||'')
end


  pg_search_scope :search_personas,
                  against: %i[paterno materno nombre],
                  ignoring: :accents,
                  using: { tsearch: { dictionary: 'spanish' } }
end
