class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :comment, limit: 400
      t.string :author, limit: 50
    end
  end
end
