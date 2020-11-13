class Prodcategoria < ApplicationRecord

    before_save :default_values 
 
    has_one :producto

    validates :nomcategoria, presence:true

    def default_values
        self.estado ||= 'A'
    end  

end
