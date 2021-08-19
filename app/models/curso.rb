class Curso < ApplicationRecord
  belongs_to :actividad
  belongs_to :tipocurso

  validates :tipocurso_id, presence: true
  validates :fini, presence: true
  validates :ffin, presence: true
  validates :hcurso, presence: true, numericality: true
 
  validates :creditos, presence: true, numericality: true
  validates :noalumnos, presence: true, numericality: true
end
