class CreateBohconfSessions < ActiveRecord::Migration
  def change
    create_table :bohconf_sessions do |t|
      t.string :title
      t.text :abstract
      t.string :host_name
      t.string :host_email
      t.string :host_twitter
      t.text :host_bio
      t.string :session_type, :default => 'hack session'
      t.text :suggested_time
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
