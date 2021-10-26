class Cloudfile < ApplicationRecord
    self.table_name = 'cloud.cloudfiles'
    has_one_attached :actadoc
end
