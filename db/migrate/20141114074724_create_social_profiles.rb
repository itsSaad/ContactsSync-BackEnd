class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.string :label
      t.string :username
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
