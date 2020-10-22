class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # datatype, column_name, constraints
      t.string :username, null: false
      t.string :email, null: false
      t.timestamps  
    end

    # optimization and when we want uniqueness
    # foreign key for our association
    # unique constraints
    # columns that you are going to look up often
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
