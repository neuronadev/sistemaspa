class Libro < ApplicationRecord
  before_save :default_values
  
  validates :nomlibro, presence:true
  validates :editores, presence:true
  validates :isbn, presence:true
  validates :anio, presence:true
  validates :nopaginas, presence:true


  belongs_to :editorial


  def default_values
    self.estado ||= 'A'
  end 
end
