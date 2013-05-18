class ApplicationController < ActionController::Base

  helper_method :product_categories
  def product_categories
    Product.select('category').uniq
  end

end
