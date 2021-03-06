class Invoice < ApplicationRecord
  has_many :items, dependent: :delete_all

  belongs_to :user

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_uniqueness_of :invoice_id, scope: [:client_name, :user_id],
    message: 'ID already used'
  validates_presence_of :invoice_id
  validates_presence_of :client_name
  validates_presence_of :entity_name
end
