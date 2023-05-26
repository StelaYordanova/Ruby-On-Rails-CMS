# class CategoriesController < ApplicationController
#     def new
#       @category = Category.new
#     end
  
#     def create
#       @category = Category.new(category_params)
  
#       if @category.save
#         redirect_to @category, notice: 'Category was successfully created.'
#       else
#         render :new
#       end
#     end
  
#     def edit
#       @category = Category.find(params[:id])
#     end
  
#     def update
#       @category = Category.find(params[:id])
  
#       if @category.update(category_params)
#         redirect_to @category, notice: 'Category was successfully updated.'
#       else
#         render :edit
#       end
#     end
  
#     def show
#       @category = Category.find(params[:id])
#     end
  
#     private
  
#     def category_params
#       params.require(:category).permit(:name)
#     end
#   end
  