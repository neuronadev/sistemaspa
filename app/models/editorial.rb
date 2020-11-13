class Editorial < ApplicationRecord
  before_save :default_values
  
  validates :nomeditorial, presence:true
  validates :especializada, presence:true
  validates :ciudad, presence:true
  validates :pais_id, presence:true
  validates :ambito_id, presence:true

  belongs_to :pais
  belongs_to :ambito

  def default_values
    self.estado ||= 'A'
  end  

end
