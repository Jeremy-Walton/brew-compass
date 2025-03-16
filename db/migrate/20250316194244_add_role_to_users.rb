class AddRoleToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string, default: 'user', null: false
    add_column :users, :super_admin, :boolean, default: false, null: false
  end
end
