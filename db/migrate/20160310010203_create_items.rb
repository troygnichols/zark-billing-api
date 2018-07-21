class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :description
      t.float :quantity
      t.float :unit_price
      t.integer :invoice_id, null: false

      t.timestamps
    end
  end
end
