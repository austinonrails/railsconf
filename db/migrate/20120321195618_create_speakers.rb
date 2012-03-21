class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :title
      t.text :abstract
      t.text :bio
      t.string :twitter
      t.string :email

      t.timestamps
    end
  end
end
