class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 50
      t.string :email, :limit => 50
      t.string :salt
      t.string :encrypted_password
    end
  end
end
