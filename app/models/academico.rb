class Academico < ApplicationRecord
  belongs_to :persona
  belongs_to :red
  belongs_to :categoria
  belongs_to :nivel
  
  has_many :sustantivas, inverse_of: :academico
  accepts_nested_attributes_for :sustantivas, reject_if: :all_blank, allow_destroy: true

  has_one :comite 

  #validates :noempleado, presence:true, uniqueness: true
  validates :fingreso, presence:true
  validates :fbaja, presence:true, on: :update
  validates :categoria_id, presence:true
  validates :nivel_id, presence:true
  validates :red_id, presence:true
 
  def nomred
      return self.red.nomred
  end

end
