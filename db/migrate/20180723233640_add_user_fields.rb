class AddUserFields < ActiveRecord::Migration[5.2]
  def change
    change_table(:users) do |t|
      t.column :address, :text
    end
  end
end
