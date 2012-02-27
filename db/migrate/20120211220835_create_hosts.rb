class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :twitter
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :number_of_guests
      t.integer :number_of_guests_remaining
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
