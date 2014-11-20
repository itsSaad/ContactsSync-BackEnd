class ChangeColumnToValueNIdentifierInPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :number, :string
    remove_column :emails, :email, :string

    add_column :phones, :value, :string
    add_column :emails, :value, :string

    add_column :phones, :identifier, :integer
    add_column :emails, :identifier, :integer
    
  end
end
