Movietix::Application.routes.draw do
  root :controller => 'movies', :action => 'index'

  resource :account, :controller => 'users'

  get '/auth/:provider/callback', :to => 'sessions#create'

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'

  resources :sessions
  resources :users
  resources :showtimes

  get '/admin/stats', :to => 'admin#stats', :via => 'get', :as => 'admin_stats'

  get '/showtimes/:id/buyTix', :to => 'showtimes#buyTix', :via => 'get', :as => :buy_tix
  post '/showtimes/:id/confirmTixPurchase', :to => 'showtimes#confirmTixPurchase', :as => 'confirm_tix_purchase', :via => 'post'
  get  '/showtimes/:id/confirmTixPurchase', :to => redirect('/showtimes/%{id}'), :via => 'get'
  post '/showtimes/:id/finishTixPurchase', :to => 'showtimes#finishTixPurchase', :as => 'finish_tix_purchase', :via => 'post'
  get '/movies/:movie_id/showtimes', :to => 'showtimes#showtimesByMovie'

  resources :theaters do
    #list of theater's showtimes
    resources :showtimes
  end

  resources :movies do
    #list of movie's showtimes
    resources :showtimes
  end

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
