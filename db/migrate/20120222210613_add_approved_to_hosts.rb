class AddApprovedToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :approved, :boolean, :null => false, :default => false
  end
end
