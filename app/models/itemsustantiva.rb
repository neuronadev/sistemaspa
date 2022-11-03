class Itemsustantiva < ApplicationRecord
  self.table_name = "mru.itemsustantivas"
  belongs_to :evaltecnico
  belongs_to :persona

  has_many :calificaciones, dependent: :destroy
  accepts_nested_attributes_for :calificaciones, allow_destroy: true

end
