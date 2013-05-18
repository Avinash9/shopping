class RegisterController < ApplicationController

  def index
    if !session[:user]
      @user = nil
      @new_user = User.new
    end
  end

  def create
    @user = User.new(params[:new_user])
    if request.post?
      if @user.save
        #session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Signup successful"
        redirect_to :controller => "register", :action => "success"
      else
        flash[:warning] = "Signup unsuccessful"
        redirect_to :controller => "register", :action => "index"
      end
    end
  end

  def success
    @user = nil
  end

end