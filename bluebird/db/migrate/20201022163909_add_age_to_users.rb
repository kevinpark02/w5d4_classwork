class AddAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    # method, table_name, column_name, data_type, optional constraints
    add_column :users, :age, :integer, null: false
  end
end
