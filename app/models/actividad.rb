class Actividad < ApplicationRecord

    validates :titulo, presence: true
    
    before_save :default_values
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
    has_many_attached :documentos
    has_one_attached :tesisdoc
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

    # A = Activo, capturaod por el usuario
    # U = validado por el usuario
    # C = Validado por el coordiador de red
    # S = Validado por la SA
    # G = Corregir, mensajes
    # D = No considerado
    # X = Eliminado

    def default_values
        self.estado ||= 'A'
      end  

      include PgSearch::Model
      pg_search_scope :search_by_titulo,
                       against: %i[titulo id],
                       using: { tsearch: { dictionary: 'spanish' } }

end
