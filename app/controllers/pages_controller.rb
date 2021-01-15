class PagesController < ApplicationController
  def home
  	@products = Product.paginate(page: params[:page], per_page: 27)
  end
end
