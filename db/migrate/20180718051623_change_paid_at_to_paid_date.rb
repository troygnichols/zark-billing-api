class ChangePaidAtToPaidDate < ActiveRecord::Migration[4.2]
  def change
    change_table :invoices do |t|
      t.remove :paid_at
      t.column :paid_date, :string
    end
  end
end
