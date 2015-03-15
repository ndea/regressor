class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.string :city
      t.string :zip
      t.string :street
      t.string :country
      t.text :further_information
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_addresses, :users
  end
end
