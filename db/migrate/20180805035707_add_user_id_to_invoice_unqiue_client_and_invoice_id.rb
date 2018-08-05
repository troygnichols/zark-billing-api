class AddUserIdToInvoiceUnqiueClientAndInvoiceId < ActiveRecord::Migration[5.2]
  def up
    remove_index(:invoices, name: :invoices_client_name_invoice_id)
    add_index(:invoices, [:client_name, :invoice_id, :user_id], unique: true,
              name: :invoices_client_name_user_id_invoice_id)
  end

  def down
    remove_index(:invoices, name: :invoices_client_name_user_id_invoice_id)
    add_index(:invoices, [:client_name, :invoice_id], unique: true,
              name: :invoices_client_name_invoice_id)
  end
end
