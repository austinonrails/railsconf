class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :twitter
      t.string :phone
      t.text :bio
      
      t.timestamps
    end
  end
end
