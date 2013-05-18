class AddInitialColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :hashed_password, :string
    add_column :users, :user_type, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :string
    add_column :users, :bday_day, :integer
    add_column :users, :bday_month, :integer
    add_column :users, :bday_year, :integer
    add_column :users, :s_addr_str_no, :string
    add_column :users, :s_addr_str_name, :string
    add_column :users, :s_addr_city, :string
    add_column :users, :s_addr_state, :string
    add_column :users, :s_addr_zip, :integer
    add_column :users, :b_addr_str_no, :string
    add_column :users, :b_addr_str_name, :string
    add_column :users, :b_addr_city, :string
    add_column :users, :b_addr_state, :string
    add_column :users, :b_addr_zip, :integer
  end
end
