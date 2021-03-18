class Extra < ApplicationRecord
  belongs_to :persona
  has_one_attached :documento
end
