class AddEntityAddressToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :entity_address, :text
  end
end
