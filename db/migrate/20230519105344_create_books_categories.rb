# class CreateBooksCategories < ActiveRecord::Migration[7.0]
#   def change

#     create_table :books_categories, id: false do |t|
#       t.belongs_to :book
#       t.belongs_to :category
#     end

#     # create_table :books_categories do |t|

#     #   t.timestamps
#     # end
#   end
# end


class CreateBooksCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :books_categories, id: false do |t|
      t.belongs_to :book
      t.belongs_to :category
    end

    add_index :books_categories, [:book_id, :category_id], unique: true
  end
end
