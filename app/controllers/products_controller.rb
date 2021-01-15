class ProductsController < ApplicationController
	def index
		@products = Product.paginate(page: params[:page], per_page: 6).search(params[:search])
	end
end
