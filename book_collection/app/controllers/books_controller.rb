class BooksController < ApplicationController
  def index
      @books = Book.order(:Title)
  end

  def new
      @book = Book.new
  end
  
  def create
      @book = Book.new(book_params)
      if @book.save
          flash[:notice] = "Book was added sucessfully."
          redirect_to(books_path)
      else
        render('new')
      end
  end
  

  def edit
      @book = Book.find(params[:id])
  end
  
  def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
          flash[:notice] = "Book '#{@book.Title}' was updated sucessfully."
          redirect_to(books_path(@book))
      else
        render('edit')
      end
  end

  def show
      @book = Book.find(params[:id])
  end

  def delete
      @book = Book.find(params[:id])
  end
  
  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "Book '#{@book.Title}' was removed sucessfully."
      redirect_to(books_path)
  end
  
  private
  
  def book_params
      params.require(:book).permit(:Title,:Genre, :Author, :Price, :Date)
  end
  
end
