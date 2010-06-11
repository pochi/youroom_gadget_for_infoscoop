class CreateYouroomOauths < ActiveRecord::Migration
  def self.up
    create_table :youroom_oauths do |t|
      t.integer :user_id
      t.string :consumer_key
      t.string :consumer_secret
      t.string :access_token
      t.string :access_token_secret

      t.timestamps
    end
  end

  def self.down
    drop_table :youroom_oauths
  end
end
