class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :label
      t.string :phone_number
      t.string :ext
      t.integer :user_id
      
      t.timestamps
    end
  end
end
