class CreateChirps < ActiveRecord::Migration[6.0]
  def change
    create_table :chirps do |t|
      # string <= 225 chars & body is a lot more
      t.text :body, null: false
      t.integer :author_id, null: false
    end

    add_index :chirps, :author_id
  end
end
