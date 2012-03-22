class AddTokenToBohconfSessions < ActiveRecord::Migration
  def change
    add_column :bohconf_sessions, :token, :string

  end
end
