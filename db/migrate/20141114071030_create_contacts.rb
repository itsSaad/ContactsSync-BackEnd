class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :prefix
      t.string :suffix
      t.string :nickname
      t.string :organization
      t.string :job_title
      t.string :department
      t.date :birthdate
      t.text :note
      t.datetime :creation_date
      t.datetime :modification_date
      t.string :app_id

      t.timestamps
    end
  end
end
