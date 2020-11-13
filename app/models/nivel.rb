class Nivel < ApplicationRecord
    validates :nomnivel, presence:true
    validates :clavenivel, presence:true

    has_many :academico
end
