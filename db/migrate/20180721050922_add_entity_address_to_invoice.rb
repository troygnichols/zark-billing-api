class AddEntityAddressToInvoice < ActiveRecord::Migration[4.2]
  def change
    add_column :invoices, :entity_address, :text
  end
end
