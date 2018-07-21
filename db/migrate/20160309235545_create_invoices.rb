class CreateInvoices < ActiveRecord::Migration[4.2]
  def change
    create_table :invoices do |t|
      t.string :entity_name
      t.string :client_name
      t.string :invoice_id
      t.string :issue_date
      t.string :due_date
      t.string :subject
      t.text :notes
      t.datetime :paid_at

      t.timestamps
    end
  end
end
