class AddContactRecordIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :record_id, :integer
    add_index :contacts, :record_id

    add_column :users, :last_sync, :datetime
  end
end
