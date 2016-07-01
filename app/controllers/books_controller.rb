class BooksController < ApplicationController
	before_action :set_books, except: [:index, :new, :create]

	def index
		@books = Book.all
	end

	def show
		
	end

	def new
		@book = Book.new
		@publishers = Publisher.all
		@authors = Author.all
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			flash[:success] = "Book has been created"
			redirect_to @book
		else
			flash[:danger] = "Book has not been created"
			render :new
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :isbn, :description, :published_at, :publisher_id, :page_count, :price)
	end

	def set_books
		@book = Book.find(params[:id])
	end
end