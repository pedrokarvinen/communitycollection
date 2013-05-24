Communitycollection::Application.routes.draw do
  
  #actions in admin/brands controller
  get "admin/brands/index"
  get "admin/brands/new"
  get "admin/brands/edit"
  post "admin/brands/create"
  post "admin/brands/update"
  get "admin/brands/delete"
  
  #actions in admin/initiatives controller
  get "admin/initiatives/index"
  get "admin/initiatives/new"
  get "admin/initiatives/edit"
  post "admin/initiatives/create"
  post "admin/initiatives/update"
  get "admin/initiatives/delete"
  
  #actions in admin/articles controller
  get "admin/articles/index"
  get "admin/articles/new"
  get "admin/articles/edit"
  post "admin/articles/create"
  post "admin/articles/update"
  get "admin/articles/delete"

  #actions in shop controller
  get "shop/index"
  get "shop/brands"
  
  #actions in discover controller
  get "discover/index"
  get "discover/bybrand"
  get "discover/byinitiative"
  get "discover/brand"
  get "discover/initiative"
  get "discover/article"
  
  root :to => 'shop#index'
  
  #routes for shop in front end
  match 'shop' => 'shop#index';
  
  #routes for discover in front end
  match 'discover' => 'discover#index';
  match 'discover/by-brand' => 'discover#bybrand';
  match 'discover/by-initiative' => 'discover#byinitiative';
  match 'discover/by-brand/:brand' => 'discover#brand';
  match 'discover/by-brand/:brand/:initiative' => 'discover#initiative';
  match 'discover/by-brand/:brand/:initiative/publication/:article' => 'discover#article';
  
  #routes for brands in admin
  match 'admin' => 'admin/brands#index';
  match 'admin/brands' => 'admin/brands#index';
  match 'admin/brands/create' => 'admin/brands#create';
  match 'admin/brands/:id' => 'admin/brands#edit';
  match 'admin/brands/delete/:id' => 'admin/brands#delete';
  match 'admin/brands/update/:id' => 'admin/brands#update';
  
  #routes for initiatives in admin
  match 'admin/brands/:brand_id/initiatives' => 'admin/initiatives#index';
  match 'admin/brands/:brand_id/initiatives/new' => 'admin/initiatives#new';
  match 'admin/brands/:brand_id/initiatives/create' => 'admin/initiatives#create';
  match 'admin/brands/:brand_id/initiatives/:id' => 'admin/initiatives#edit';
  match 'admin/brands/:brand_id/initiatives/update/:id' => 'admin/initiatives#update';
  match 'admin/brands/:brand_id/initiatives/delete/:id' => 'admin/initiatives#delete';

  #routes for articles in admin
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles' => 'admin/articles#index';
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles/new' => 'admin/articles#new';
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles/create' => 'admin/articles#create';
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles/:id' => 'admin/articles#edit';
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles/update/:id' => 'admin/articles#update';
  match 'admin/brands/:brand_id/initiatives/:initiative_id/articles/delete/:id' => 'admin/articles#delete';
  
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
