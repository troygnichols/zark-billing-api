class AddUniqueIndexToUserEmail < ActiveRecord::Migration[5.2]
  def up
    add_index(:users, :email, unique: true, name: :users_email_unique)
  end

  def down
    remove_index(:users, name: :users_email_unique)
  end
end
