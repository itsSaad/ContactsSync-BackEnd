class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :emails
      t.text :phones
      t.string :identifier

      t.timestamps
    end

    add_column :contacts, :user_id, :integer
    add_index :contacts, :user_id
    
  end
end
