class AddCategoryToWines < ActiveRecord::Migration
  def change
    add_column :wines, :category, :string
  end
end
