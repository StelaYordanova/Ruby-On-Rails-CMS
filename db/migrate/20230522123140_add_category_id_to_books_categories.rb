class AddCategoryIdToBooksCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :books_categories, :category_id, :integer
  end
end
