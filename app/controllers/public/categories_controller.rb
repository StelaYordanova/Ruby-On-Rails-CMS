class Public::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:sort_order).page(params[:page]).per(5)
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books.page(params[:page]).per(5)
  end
end
