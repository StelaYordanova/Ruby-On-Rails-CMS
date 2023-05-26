class Cms::BooksController < ApplicationController
    def index
      @books = Book.where("title LIKE ?", "%#{params[:search]}%")
      @books = Book.all
      # @books = Book.page(params[:page]).per(10)
    end
  
    def new
      @book = Book.new
      @categories = Category.all
    end
  
    def create
      @book = Book.new(book_params)
      @categories = Category.all
  
      if @book.save
        # redirect_to @book, notice: 'Book was successfully created.'
        # redirect_to cms_book_path(@book.id), notice: 'Book was successfully created.'

        redirect_to cms_book_path(@book), notice: 'Book was successfully created.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @book = Book.find(params[:id])
      @categories = Category.all
    end
  
    def update
      @book = Book.find(params[:id])
      @categories = Category.all
  
      if @book.update(book_params)
        redirect_to cms_book_path(@book.id)
      else
        render :edit
      end
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def search
      @search_query = params[:search]
      @books = Book.where("title LIKE ?", "%#{@search_query}%")
      @books = @books.order(:title)
      render :index
    end
    
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to cms_books_path, notice: 'Book was successfully deleted.'
    end
    
    private
  
    def book_params
      params.require(:book).permit(:title, :year_of_publication, :author_id, category_ids: [])
      # params.require(:book).permit(:title, :year_of_publication, :author_id, category_ids: [])
    end
  end
  