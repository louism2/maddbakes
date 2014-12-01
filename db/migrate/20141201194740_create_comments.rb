class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, limit: 500
      t.string :commenter_name, limit: 40 
      t.references :post
      t.timestamps
    end
  end
end
