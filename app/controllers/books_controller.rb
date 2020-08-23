class BooksController < ApplicationController
	before_action :authenticate_user!
	# before_action :correct_user,   only: [:edit, :update, :destroy]

	def create
		@user = current_user
		@books = Book.all
		@book = Book.new(book_params)
	 	@book = current_user.books.build(book_params)
		if @book.save
			flash[:notice] = 'You have creatad book successfully.'
			redirect_to book_path(@book.id)
		else
			render :index
		end
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
 	 	@user = User.find_by(id: @book.user_id)

	end

	def edit
		@book = Book.find(params[:id])
		@user = User.find_by(id: @book.user_id)
		if @book.user == current_user
			render :edit
		else
			redirect_to books_path
		end
	end

	def update
		@user = current_user
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = 'You have updated book successfully.'
			redirect_to book_path(@book.id)
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
