class Cms::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    # @categories = Category.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to cms_category_path(@category), notice: 'Category was successfully created.'
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to cms_category_path(@category), notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to cms_categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
