class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :street
      t.string :city
      t.string :zip
      t.string :country
      t.string :country_code

      t.integer :contact_id

      t.timestamps
    end
  end
end
