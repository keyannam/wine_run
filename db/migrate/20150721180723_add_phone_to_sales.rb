class AddPhoneToSales < ActiveRecord::Migration
  def change
    add_column :sales, :phone, :string
  end
end
