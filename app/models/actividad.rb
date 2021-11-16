class Actividad < ApplicationRecord

    #validates :titulo, presence: true

    
    #before_save :default_values
    has_one :articulo
    has_one :libroarbitrado
    has_one :capitulo
    has_one :curso
    has_one :tesista
    has_one :editor
    has_one :patente
    has_one :vinculacion
    has_one :divulgacion
    has_one :fasciculo
    has_many :mensajes
    has_many :valetapas
    has_many_attached :documentos
    has_one_attached :tesisdoc  #Acta de examen
    has_one_attached :tesisportada #Portada de la tesis
    has_one_attached :tesiscarta #Carta de designacion
    has_one_attached :enlacedoc
    accepts_nested_attributes_for :articulo
    accepts_nested_attributes_for :libroarbitrado
    accepts_nested_attributes_for :capitulo
    accepts_nested_attributes_for :curso
    accepts_nested_attributes_for :tesista
    accepts_nested_attributes_for :editor
    accepts_nested_attributes_for :patente
    accepts_nested_attributes_for :vinculacion
    accepts_nested_attributes_for :divulgacion
    accepts_nested_attributes_for :fasciculo

    has_many :autores, dependent: :destroy
    accepts_nested_attributes_for :autores, allow_destroy: true
    has_many :personas, through: :autores
    
    belongs_to :producto
    validates :titulo, :fechapub, presence: true, if: Proc.new { |p| [1,2,3,4,5,8,22,37,39].include? p.producto_id  }
    validates :titulo, :anio, presence: true, if: Proc.new { |p| [6,7,11,13,14,15,16,17,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,40,41,81,85].include? p.producto_id  }
    
    validates :titulo, :anio, presence: true, if: Proc.new { |p| [42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80].include? p.producto_id  }
    validates :asignared, presence: true, if: -> { self.producto_id != 83 && self.producto_id != 82 && self.producto_id != 39 && self.producto_id != 22  }


    #with_options if: :producto_id == 1 do |p|
    #     validates_presence_of :titulo
    #     validates_presence_of :fechapub
    #end

    # A = Activo, capturaod por el usuario
    # U = validado por el usuario
    # C = Validado por el coordiador de red
    # S = Validado por la SA
    # G = Corregir, mensajes
    # D = No considerado
    # X = Eliminado

    #def default_values
    #    self.estado ||= 'A'
    #  end  

      include PgSearch::Model
      pg_search_scope :search_by_titulo,
                       against: %i[titulo id],
                       using: { tsearch: { dictionary: 'spanish' } }

end
