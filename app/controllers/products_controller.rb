class ProductsController < ApplicationController
  def index
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
    end
    @new_products = Product.where(:old_new => 'New')
  end

  def detail
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
    end
    @product = Product.find(params[:p_id])
    @sc_add = Shoppingcart.new
  end

  def category
    if @user = session[:user]
      @sc_items = Shoppingcart.retrieve_cart(@user.id)
    end
    @products = Product.where(:category => params[:p_category])
    @product = Product.new(:category => params[:p_category])
  end

  def add
    @sc_dont_show = true
    @user = session[:user]
    @product = Product.new
  end

  def create
    @sc_dont_show = true
    @new_product = Product.new(params[:product])
    if params[:commit] == "Add Product"
      if @new_product.save
        redirect_to :controller => "admin", :action => "index"
      else
        redirect_to :controller => "products", :action => "add"
      end
    elsif params[:commit] == "Cancel"
        redirect_to :controller => "admin", :action => "index"
    end
  end

  def modify
    @sc_dont_show = true
    @user = session[:user]
    @product_all = Product.all
  end

  def modify_actual
    @sc_dont_show = true
    @user = session[:user]
    @modify_product = Product.find(params[:p_id])
    @product = Product.new
  end

  def update
    @sc_dont_show = true
    @user = session[:user]
    @modify_product = Product.find(params[:p_id])
    @product = Product.new(params[:product])

    if params[:commit] == "Modify"
      @modify_product.name = @product.name
      @modify_product.description = @product.description
      @modify_product.quantity = @product.quantity
      @modify_product.price = @product.price
      @modify_product.category = @product.category
      @modify_product.related_type = @product.related_type
      @modify_product.old_new = @product.old_new
      @modify_product.image_url = @product.image_url

      if @modify_product.save!
        redirect_to :controller => "products", :action => "modify"
      else
        redirect_to :controller => "products", :action => "modify_actual", :p_id => @modify_product.id
      end
    elsif params[:commit] == "Cancel"
      redirect_to :controller => "products", :action => "modify"
    end
  end

  def destroy
    @modify_product = Product.find(params[:p_id])
    @modify_product.delete
    redirect_to :controller => "products", :action => "modify"
  end
end
