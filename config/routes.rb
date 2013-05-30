Shopping::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  #match 'users' => 'users#index'

  #Users
  match 'users' => 'users#index'
  match 'users/index' => 'users#index'
  match 'users/login' => 'users#login'
  match 'users/logout' => 'users#logout'
  match 'users/create' => 'users#create'
  match 'users/add' => 'users#add'
  match 'users/modify' => 'users#modify'
  match 'users/modify_actual' => 'users#modify_actual'
  match 'users/update' => 'users#update'
  match 'users/destroy' => 'users#destroy'
  match 'users/checkout' => 'users#checkout'
  match 'users/checkout_confirm' => 'users#checkout_confirm'
  match 'users/payment_confirm' => 'users#payment_confirm'
  match 'users/fb_connect' => 'users#fb_connect'
  match 'users/fb_success' => 'users#fb_success'
  match 'users/fb_invite' => 'users#fb_invite'

  #Products
  match 'products' => 'products#index'
  match 'products/index' => 'products#index'
  match 'products/add' => 'products#add'
  match 'products/create' => 'products#create'
  match 'products/modify' => 'products#modify'
  match 'products/destroy' => 'products#destroy'
  match 'products/modify_actual' => 'products#modify_actual'
  match 'products/update' => 'products#update'
  match 'products/detail' => 'products#detail'
  match 'products/category' => 'products#category'

  #Register
  match 'register' => 'register#index'
  match 'register/index' => 'register#index'
  match 'register/create' => 'register#create'
  match 'register/success' => 'register#success'

  #Admin
  match 'admin' => 'admin#index'
  match 'admin/index' => 'admin#index'

  #About Us
  match 'aboutus' => 'aboutus#index'
  match 'aboutus/index' => 'aboutus#index'

  #Contact Us
  match 'contactus' => 'contactus#index'
  match 'contactus/index' => 'contactus#index'

  #Shopping Cart
  match 'shoppingcarts' => 'shoppingcarts#index'
  match 'shoppingcarts/index' => 'shoppingcarts#index'
  match 'shoppingcarts/add' => 'shoppingcarts#add'
  match 'shoppingcarts/update' => 'shoppingcarts#update'
  match 'shoppingcarts/checkout' => 'shoppingcarts#checkout'

  #About Us
  match 'search' => 'search#index'
  match 'search/index' => 'search#index'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
