class AddHideToSpeakersAndBohconfSessions < ActiveRecord::Migration
  def change
    add_column :speakers, :hide, :boolean, :null => false, :default => false
		add_column :bohconf_sessions, :hide, :boolean, :null => false, :default => false
  end
end
