class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :likes
      t.integer :chef_id, :recipe_id
      t.timestamps
    end
  end
end
