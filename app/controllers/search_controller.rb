class SearchController < ApplicationController

  def index
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
    end
    if search = params[:search]
      @products = Product.where("name LIKE '%#{search}%'")
    else

    end
  end

end
