class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content, limit: 3000
    end
  end
end
