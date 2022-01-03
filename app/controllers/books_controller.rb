class BooksController < ApplicationController

  before_action :set_books, only: [:edit, :update, :destroy]
  before_action :set_editorials, only: [:new, :edit,:create,:update]
  before_action :set_categories, only: [:new, :edit,:create,:update]
  before_action :set_authors, only: [:new, :edit,:create,:update]


  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save 
        format.json {head :no_content }
        format.js 
      else 
        format.js do 
          errors_count = @book.errors.size
          flash.now.alert = "#{errors_count} #{"Error/es".pluralize(errors_count)} Verificar El Registro !!"
          render :new 
      end
         format.json { render json: @book.errors.full_messages, status: :unprocessable_entity } 
      end
    end
  end

  def update
   respond_to do |format|
     if @book.update(book_params)
        format.json {head :no_content}
        format.js
     else
      format.json {render json: @book.errors.full_messages, status: :unprocessable_entity}
      format.js do
        errors_count = @book.errors.size
        flash.now.alert = "#{errors_count} #{"Error/es".pluralize(errors_count)} Verificar El Registro !!"
        render :edit 
      end
     

      end
   end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js
      format.json {head :no_content}
    end
  end

private 

  def book_params 
      params.require(:book).permit(:imagen, :titulo, :edicion, :editorial_id, :category_id, :author_id)
  end

  def set_books
    @book = Book.find(params[:id])
  end

  def set_editorials
    @editoriales = Editorial.all
  end

  def set_categories
    @categorias = Category.all
  end

  def set_authors
    @autores = Author.all
  end



end
