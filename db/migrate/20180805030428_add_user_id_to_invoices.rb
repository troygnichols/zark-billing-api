class AddUserIdToInvoices < ActiveRecord::Migration[5.2]
  def up
    add_belongs_to :invoices, :user
  end

  def down
    remove_belongs_to :invoices, :user
  end
end
