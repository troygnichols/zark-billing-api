class AddUniqueIndexInvoiceClientNameInvoiceId < ActiveRecord::Migration[5.2]
  def up
    add_index(:invoices, [:client_name, :invoice_id], unique: true,
              name: :invoices_client_name_invoice_id)
  end

  def down
    remove_index(:users, name: :invoices_client_name_invoice_id)
  end
end
