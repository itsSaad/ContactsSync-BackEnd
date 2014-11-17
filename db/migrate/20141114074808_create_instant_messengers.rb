class CreateInstantMessengers < ActiveRecord::Migration
  def change
    create_table :instant_messengers do |t|
      t.string :label
      t.string :username
      t.string :url
      t.integer :contact_id

      t.timestamps
    end
  end
end
