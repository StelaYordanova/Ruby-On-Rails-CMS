
class Cms::AuthorsController < ApplicationController
  def index
    @authors = Author.all
    # @authors = Author.page(params[:page]).per(10)
  end
  
  def new
    @author = Author.new
  end


  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to cms_author_path(@author), notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to cms_author_path(@author), notice: 'Author was successfully updated.'
    else
      render :edit, status: 422
    end
 
  end
  
    def show
      @author = Author.find(params[:id])
    end

    
    def destroy
      author = Author.find(params[:id])
      author.destroy
      redirect_to cms_authors_path, notice: 'Author was successfully destroyed.'
    end
    
  
    private
  
    def author_params
      params.require(:author).permit(:name)
    end
  end


# end


