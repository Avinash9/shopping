class ApplicationController < ActionController::Base

  helper_method :product_categories
  def product_categories
    Product.select('category').uniq
  end

  def facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new('338774666212397', '24b36c29367634e0149b45cc7061a0fe').get_user_info_from_cookie(cookies)
  end

end
