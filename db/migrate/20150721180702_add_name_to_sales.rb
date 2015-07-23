class AddNameToSales < ActiveRecord::Migration
  def change
    add_column :sales, :name, :string
  end
end
