Rails.application.routes.draw do
  get 'carts/show'

  devise_for :users
  
  get "countries/:country_id/provinces" => "application#provinces", :as => "provinces", :format => :json
  get "provinces/:province_id/cities" => "application#cities", :as => "cities", :format => :json

  root to: 'static_pages#home', via: :get
  
  match '/help',      to: 'static_pages#help', via: :get
  match '/about',     to: 'static_pages#about', via: :get
  match '/contact',   to: 'static_pages#contact', via: :get

  resources :users
  resources :microposts, only: [:create, :destroy]
  resources :friendships, only: [:index, :create, :destroy]
  get 'friendship/create'
  get 'friendship/destroy'
  
  resources :commerces
  match '/my_commerces', to: "commerces#my_commerces", via: :get
  resources :branches
  get '/branch/profile/:id' => "branches#profile", as: "branch_profile"
  resources :publications, only: [:create, :destroy]
  
  resources :menus
  resources :items
  
  resource :cart, only: [:show]
  resources :order_lines, only: [:create, :update, :destroy]
  
  match '/accept_request', to: "friendships#accept_request", via: :post
  match '/cancel_request', to: "friendships#cancel_request", via: :post
  match '/unfriend', to: "friendships#unfriend", via: :post
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
