class CreateBreeders < ActiveRecord::Migration
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :imageurl
      t.string :age
      t.string :breeds
      t.string :city
      t.string :father
      t.string :mother
      t.string :injectionurl
      t.integer :health
      t.integer :gender
      t.integer :user_id
      t.string :user_email

      t.timestamps null: false
    end
  end
end
