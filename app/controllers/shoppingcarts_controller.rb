class ShoppingcartsController < ApplicationController
  def index
    @sc_dont_show = true
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
      #Shoppingcart.find_by_sql("SELECT p.name, p.description, p.price, p.image_url, sc.id, sc.quantity
      #                                      FROM products p, shoppingcarts sc
      #                                      WHERE p.id = sc.product_id AND sc.user_id = " + @user.id)
      @sc_categories = Shoppingcart.find_by_sql("SELECT distinct(p.category)
                                                  FROM shoppingcarts sc, products p
                                                  WHERE p.id = sc.product_id AND sc.user_id = " + @user.id.to_s)
    else
      @sc_items = NIL
      @sc_categories = NIL
      end

    @sc = Shoppingcart.new
    @total_cost = 0
    @total_shipping = 6
    @total_tax = 0

    #@sc_related_products = Shoppingcart.find_by_sql("SELECT * FROM products WHERE category IN@sc_categories + ")")
    #@sc_related_products = Product.find_by_sql("SELECT * from products WHERE related_type = 'Office'")
  end

  def checkout
    if params[:commit] == "Checkout"
      redirect_to :controller => "users", :action => "checkout"
    elsif params[:commit] == "Continue Shopping"
      redirect_to :controller => "products", :action => "index"
    end
  end

  def update
    if params[:commit] == "Update"
      @sc_update = Shoppingcart.find(params[:shoppingcart][:id])
      @sc_update.quantity = params[:shoppingcart][:quantity]
      if @sc_update.save!
        redirect_to :controller => "shoppingcarts", :action => "index"
      else
        redirect_to :controller => "shoppingcarts", :action => "index"
      end
    elsif params[:commit] == "Delete"
      @sc_delete = Shoppingcart.find(params[:shoppingcart][:id])
      @sc_delete.delete
      redirect_to :controller => "shoppingcarts", :action => "index"
    end
  end

  #How to handle SC for Guest users --> do you make them register/login or allow them to add stuff and during checkout make them register
  def add
    if @user = session[:user]
      if params[:commit] == "Add to Cart"
        @sc_add = Shoppingcart.new(params[:sc_add])

        #Update the Qty
        if @sc_item = Shoppingcart.where(:user_id => @user.id, :product_id => params[:p_id]).first
          @sc_item.quantity = @sc_item.quantity + @sc_add.quantity
        #Add a new Item to SC
        else
          @sc_item = Shoppingcart.new(:user_id => @user.id, :product_id => params[:p_id], :quantity => @sc_add.quantity)
          #@sc_item = Product.find(params[:p_id]).shoppingcarts.create(:user_id => @user.id,:quantity => @sc_add.quantity)
        end
        #Save it to the DB
        if @sc_item.save!
          redirect_to :controller => "shoppingcarts", :action => "index"
        else
          redirect_to :controller => "products", :action => "detail", :p_id => params[:p_id]
        end
      elsif params[:commit] == "Continue Shopping"
        redirect_to :controller => "products", :action => "index"
      end
    else
      #Re-direct to Registration page and once registered successfully, bring them back to their cart with the item already added in it.
      # Control it with the Methods defined in Model for Shopping_Cart
      redirect_to :controller => 'register', :action => 'index'
    end
  end

#End of Class
end