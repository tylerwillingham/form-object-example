class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :encrypted_password

      t.timestamps null: false
    end
  end
end
