class Tesista < ApplicationRecord
  belongs_to :nivelestudio
  belongs_to :actividad

  validates :acta, presence: true
  validates :nivelestudio_id, presence: true
  validates :fgrado, presence: true
  validates :efterminal, presence: true

end
