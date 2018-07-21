class Item < ApplicationRecord
  belongs_to :invoice, dependent: :delete
end
