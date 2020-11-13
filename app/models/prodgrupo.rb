class Prodgrupo < ApplicationRecord

  before_save :default_values 

  validates :nomgrupo, presence:true

  has_one :producto

  def default_values
    self.estado ||= 'A'
end  

end
