class Cms::BooksController < Cms::BaseCmsController
    before_action :set_form_options, only: [:new, :create, :edit, :update]

    def index
      @books = Book.all
      if params[:search].present?
        @books = @books.where("title LIKE ?", "%#{ params[:search] }%")
      end
      
      @books = @books.order(:title)
      render :index
    end
  
    def new
      @book = Book.new
      @categories = Category.all
    end
  
    def create
      @book = Book.new(book_params)
      @categories = Category.all
  
      if @book.save
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

    def set_form_options
      @form_options = OpenStruct.new
      @form_options.author_options = Author.all.map {|a| [a.name, a.id]}
      @form_options.categories = Category.all
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to cms_books_path, notice: 'Book was successfully deleted.'
    end
    
    private
  
    def book_params
      params.require(:book).permit(:title, :year_of_publication, :author_id, category_ids: [])
    end
  end
  