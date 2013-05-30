class UsersController < ApplicationController
  require "koala"

  def fb_connect
    session[:jigar] = Koala::Facebook::OAuth.new(ENV['FB_APP_ID'], ENV['FB_SECRET_KEY'], ENV['SITE_URL'] + '/users/fb_success')
    @auth_url =  session[:jigar].url_for_oauth_code(:permissions=>"email,
                                                                  user_birthday, friends_birthday,
                                                                  read_friendlists, read_mailbox,
                                                                  user_about_me, friends_about_me,
                                                                  user_location, friends_location,
                                                                  user_photos,friends_photos")
  end

  def fb_success
    if session[:access_token].nil?
      session[:access_token] = session[:jigar].get_access_token(params[:code])
    else
      session[:access_token] = session[:jigar].get_access_token(params[:code])
    end
    #session[:access_token] = session[:jigar].exchange_access_token_info(session[:access_token])

    @api = Koala::Facebook::API.new(session[:access_token])
    @me = @api.get_object("/me")
    #@me_albums = @api.get_object("/me/albums")
    @me_friends = @api.get_object("/me/friends?fields=id,name,birthday,username,email")
    #render :xml => session
  end

  def fb_invite
    # Send an e-mail invitation to that friend
    flash[:message] = params[:username] + " invited to join AB"
    redirect_to :controller => 'users', :action => 'fb_success'
  end

  def facebook_friend_detail
    @api = Koala::Facebook::API.new(session[:access_token])

  end
=begin
  def facebook_success
    #@graph_status = @api.get_object("/me/statuses", "fields"=>"message")
    #render :json => rest_graph.get('me/home')['data'].first
    #render :json => rest_graph.get('me/feed').inspect
  end
=end

  def index
    @user = nil
    @login_user = User.new
  end

  def checkout
    @sc_dont_show = true
    @user = session[:user]
    @final_cost = params[:total_cost]
    @order = Order.new
  end

  def checkout_confirm
    @user = session[:user]
    @new_order = Order.new(params[:order])

    if @new_order.save!
      @order = Order.find_all_by_user_id(@user.id).last
      @sc_items = Shoppingcart.find_all_by_user_id(@user.id)

      @sc_items.each do |sc_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.product_id = sc_item.product_id
        @order_item.product_qty = sc_item.quantity
        @price = Product.find_by_sql("SELECT price FROM products WHERE id = " + @order_item.product_id.to_s)
        @order_item.product_unit_price = @price.to_param
        if @order_item.save!
        end
      end
      # Delete the entire Shopping Cart for this particular user
      Shoppingcart.destroy_all(:user_id => @user.id)

      redirect_to :controller => "users", :action => "payment_confirm"
    elsif
      redirect_to :controller => "users", :action => "checkout"
    end
  end

  def payment_confirm
    @sc_dont_show = true
    @user = session[:user]
    @order = Order.find_all_by_user_id(@user.id).last
    @order_product_details = OrderItem.find_by_sql("SELECT p.name,p.description,o.product_qty,p.price
                              FROM order_items o,products p
                              WHERE p.id = o.product_id AND o.order_id = " + @order.id.to_s)
    @total_cost = 0
    @total_shipping = 6
    @total_tax = 0
  end

  def login
    if request.post?
      if @user = User.authenticate(params[:login_user][:username],params[:login_user][:password])
        session[:user] = @user
        flash[:message] = "Login successful"
        if (@user.user_type == "Manager")
          redirect_to :controller => "admin", :action => "index"
        else #user_type = "Customer"
          redirect_to :controller => "products", :action => "index"
        end
      else
        flash[:warning] = "Login unsuccessful"
        redirect_to :controller => "users", :action => "index"
      end
    end
  end

  def add
    @sc_dont_show = true
    @user = session[:user]
    @new_user = User.new
  end

  def create
    @sc_dont_show = true
    @user = session[:user]
    @new_user = User.new(params[:new_user])

    if params[:commit] == "Register"
      if @new_user.save
        redirect_to :controller => "admin", :action => "index"
      else
        redirect_to :controller => "users", :action => "add"
      end
    elsif params[:commit] == "Cancel"
      redirect_to :controller => "admin", :action => "index"
    end
  end

  def modify
    @sc_dont_show = true
    @user = session[:user]
    @user_all = User.all
  end

  def modify_actual
    @sc_dont_show = true
    @user = session[:user]
    @modify_user = User.find(params[:u_m_id])
    @modified_user = User.new
  end

  def update
    @sc_dont_show = true
    @user = session[:user]
    @modify_user = User.find(params[:u_m_id])
    @modified_user = User.new(params[:modified_user])

    if params[:commit] == "Modify"
      @modify_user.user_type = @modified_user.user_type
      @modify_user.firstname = @modified_user.firstname
      @modify_user.lastname = @modified_user.lastname
      @modify_user.s_addr_str_no = @modified_user.s_addr_str_no
      @modify_user.s_addr_str_name = @modified_user.s_addr_str_name
      @modify_user.s_addr_city = @modified_user.s_addr_city
      @modify_user.s_addr_state = @modified_user.s_addr_state
      @modify_user.s_addr_zip = @modified_user.s_addr_zip
      if @modify_user.save!
        redirect_to :controller => "users", :action => "modify"
      else
        redirect_to :controller => "users", :action => "modify_actual", :u_m_id => @modify_user.id
      end
    elsif params[:commit] == "Cancel"
      redirect_to :controller => "users", :action => "modify"
    end
  end

  def destroy
    @modify_user = User.find(params[:u_m_id]).delete
    redirect_to :controller => "users", :action => "modify"
  end

  def logout
    #reset_session[:user]
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to root_path
  end

  private
=begin
  def filter_setup_rest_graph
    scope = []
    # Default User Info + below mentioned permissions will be requested
    scope << 'email'
    scope << 'user_birthday'
    scope << 'friends_birthday'
    scope << 'user_location'
    scope << 'friends_location'
    scope << 'friends_photos'
    scope << 'read_stream' #re-arrange this later on
    rest_graph_setup(:auto_authorize => true, :auto_authorize_scope => scope.join(','))
  end
=end
  #End of Class
end
