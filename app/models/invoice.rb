class Invoice < ApplicationRecord
  has_many :items, dependent: :delete_all

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_uniqueness_of :invoice_id, scope: :client_name
end
