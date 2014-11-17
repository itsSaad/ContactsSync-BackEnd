class AddCompositeNameToUsers < ActiveRecord::Migration
  def change
    add_column :contacts, :composite_name, :string
    remove_column :phones, :phone_number, :string
    add_column :phones, :number, :string
  end
end
