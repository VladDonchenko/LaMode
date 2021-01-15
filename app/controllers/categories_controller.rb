class CategoriesController < ApplicationController
	  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    
   
  end

  def search
    @categories_list = Category.all
    @product_list = Product.where('title LIKE ?', "%#{params[:product_title.to_s]}%")
    products_list
    render :'categories/show'
  end




  def sort_column
    Product.column_titles.include?(params[:sort]) ? params[:sort] : nil
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
  end


  def minimum
    params[:min].nil? || params[:min] == '' ? 0 : params[:min]
  end

  def maximum
    params[:max].nil? ? 99_999_999_999 : params[:max]
  end
  def products_list
    @products = if params[:min].nil? && params[:max].nil?
                  sort_column && sort_direction ? @product_list.order("#{sort_column} #{sort_direction}") : @product_list
                else
                  if !(sort_column && sort_direction)
                    @product_list.min_price(minimum).max_price(maximum).order(sort_column.to_s)
                  else @product_list.min_price(minimum).max_price(maximum).order("#{sort_column} #{sort_direction}")
                  end
                end
    @pagy, @products = pagy(@products)
  end

end
