class Evaltecnico < ApplicationRecord
  self.table_name = 'mru.evaltecnicos'
  belongs_to :persona
  has_many :itemsustantivas, dependent: :destroy
  accepts_nested_attributes_for :itemsustantivas, reject_if: :all_blank, allow_destroy: true
end
