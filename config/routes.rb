Communitycollection::Application.routes.draw do
  
  get "admin/brands/index"
  get "admin/brands/new"
  get "admin/brands/edit"
  post "admin/brands/create"
  post "admin/brands/update"
  get "admin/brands/delete"

  get "shop/index"
  get "shop/brands"
  
  get "discover/index"
  get "discover/bybrand"
  get "discover/byinitiative"
  get "discover/brand"
  get "discover/initiative"
  get "discover/article"
  
  root :to => 'shop#index'
  
  match 'shop' => 'shop#index';
  
  match 'discover' => 'discover#index';
  match 'discover/by-brand' => 'discover#bybrand';
  match 'discover/by-initiative' => 'discover#byinitiative'
  match 'discover/by-brand/:brand' => 'discover#brand'
  match 'discover/by-brand/:brand/:initiative' => 'discover#initiative'
  match 'discover/by-brand/:brand/:initiative/publication/:article' => 'discover#article'
  
  match 'admin' => 'admin/brands#index';
  match 'admin/brands' => 'admin/brands#index';
  match 'admin/brands/:id' => 'admin/brands#edit';
  match 'admin/brands/delete/:id' => 'admin/brands#delete'
  match 'admin/brands/update/:id' => 'admin/brands#update'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
