class AddUserActivationFields < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :active, :boolean, default: false
    add_column :users, :activation_digest, :string
    add_column :users, :activated_at, :datetime
  end

  def down
    remove_column :users, :active
    remove_column :users, :activation_digest
    remove_column :users, :activated_at
  end
end
