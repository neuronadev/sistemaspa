class Categoria < ApplicationRecord
    validates :nomcategoria, presence:true
    validates :clavecategoria, presence:true

    has_many :academico
end
