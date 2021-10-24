class Vinculacion < ApplicationRecord
  belongs_to :actividad

  validates :nivelcomite, presence: true, if: Proc.new { |v| [33].include? v.actividad.producto_id }
  validates :niveldecreto, presence: true, if: Proc.new { |v| [24].include? v.actividad.producto_id }
  validates :niveliniciativa, presence: true, if: Proc.new { |v| [31].include? v.actividad.producto_id }
  validates :ordenamiento, presence: true, if: Proc.new { |v| [30].include? v.actividad.producto_id }
  validates :nivelregla, presence: true, if: Proc.new { |v| [32].include? v.actividad.producto_id }
end
