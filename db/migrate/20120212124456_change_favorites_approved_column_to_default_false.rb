class ChangeFavoritesApprovedColumnToDefaultFalse < ActiveRecord::Migration
  def up
  	remove_column :favorites, :approved
  	add_column :favorites, :approved, :boolean, :null => false, :default => false
  end

  def down
  end
end
