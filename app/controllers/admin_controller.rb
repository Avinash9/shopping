class AdminController < ApplicationController
  def index
    @sc_dont_show = true
    @user = session[:user]
  end
end
