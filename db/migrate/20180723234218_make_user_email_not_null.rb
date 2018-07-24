class MakeUserEmailNotNull < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.transaction do
      User.where(email: nil).update_all(email: 'TEMP_EMAIL')
      change_column :users, :email, :string, null: false
    end
  end

  def down
    change_column :users, :email, :string, null: true
  end
end
