class Public::HomeController < ApplicationController
  def index
    @categories = Category.order(:sort_order).all
    @books_per_category = {}
    @categories.each do |category|
    @books_per_category[category.id] = category.books.limit(5)
    end
  end
end
