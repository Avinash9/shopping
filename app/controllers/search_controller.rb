class SearchController < ApplicationController

  def index
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
    end
  end

end
