require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

	describe "GET #index" do
		it "returns a successful http status code" do
			get :index

			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #show" do
		it "returns a successful http status code" do
			book = Fabricate(:book)

			get :show, id: book
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #new" do
		it "returns a successful http status code" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST #create" do
		context "a successful create" do
			before do
				post :create, book: Fabricate.attributes_for(:book)
			end

			it "saves the new book object" do
				expect(Book.count).to eq(1)
			end

			it "redirects to the show action" do
				expect(response).to redirect_to book_path(Book.last)
			end

			it "sets the successful flash message" do
				expect(flash[:success]).to eq('Book has been created')
			end
		end

		context "unsuccessful create" do

			it "does not save the book object with invalid input" do
				post :create, book: Fabricate.attributes_for(:book, title: nil)

				expect(Book.count).to eq(0)
			end

			it "sets the failure flash message" do
				post :create, book: Fabricate.attributes_for(:book, title: nil)
								
				expect(flash[:danger]).to eq('Book has not been created')
			end
		end

	end

end