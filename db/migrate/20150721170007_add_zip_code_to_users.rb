class AddZipCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zipcode, :string
  end
end
