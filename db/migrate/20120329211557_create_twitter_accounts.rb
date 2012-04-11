class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :oauth_token_verifier
      t.text :oauth_authorize_url
      t.text :stream_url
      t.string :screen_name
      t.boolean :active, :default => true, :null => false
      t.timestamps
    end
  end
end
