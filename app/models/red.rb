class Red < ApplicationRecord
    validates :nomred, presence:true

    has_many :academico

end
