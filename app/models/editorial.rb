class Editorial < ApplicationRecord
  before_save :default_values
  
  validates :nomeditorial, presence:true
  validates :especializada, presence:true
  validates :ciudad, presence:true
  validates :pais_id, presence:true
  validates :ambito_id, presence:true

  belongs_to :pais
  belongs_to :ambito

  has_one :libro
  accepts_nested_attributes_for :libro

  has_one :revista
  accepts_nested_attributes_for :revista


  def default_values
    self.estado ||= 'A'
  end  

end
