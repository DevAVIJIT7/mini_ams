class AddFirstNameLastNameToMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :member_type, :string
    add_column :members, :tenant_id, :string
  end
end
