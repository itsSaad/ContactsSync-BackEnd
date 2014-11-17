class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :label
      t.string :email
      t.integer :contact_id

      t.timestamps
    end
  end
end
