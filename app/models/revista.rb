class Revista < ApplicationRecord
 before_save :default_values

 validates :nomrevista, presence:true 
 validates :issn, presence:true,  if: Proc.new { |p| ['J','O','Y'].include? p.tiporevista  }
 #validates :cuartil, presence:true 
 #validates :factor, presence:true 
 #validates :editorial_id, presence:true 

 belongs_to :editorial
 has_one :articulo
 has_many :cuartiles

  def default_values
    self.estado ||= 'A'
  end 
end
