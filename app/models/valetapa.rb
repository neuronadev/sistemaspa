class Valetapa < ApplicationRecord
  belongs_to :actividad
  belongs_to :persona
  has_rich_text :txtmensaje
end
