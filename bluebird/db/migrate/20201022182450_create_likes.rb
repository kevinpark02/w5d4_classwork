class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :chirp_id, null: false
      t.timestamps
    end

    add_index :likes, [:chirp_id, :liker_id], unique: true #checking uniqueness for pair of foreign keys
    add_index :likes, :liker_id 
  end
end
