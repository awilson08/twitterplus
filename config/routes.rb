TwitterBasicPlus::Application.routes.draw do


root :to => 'home#index', as: 'home'

get '/sessions/new' => 'Sessions#new', as: 'signin'
post '/sessions' => 'Sessions#create', as: 'sessions'
delete '/sessions' => 'Sessions#destroy', as: 'session'

#tweets
get "tweets/new", controller: 'tweets', action: 'new', as: 'new_tweet'
get 'tweets/:id', controller: 'tweets', action: 'show', as: 'show_tweet'
get "/tweets", controller: 'tweets', action: 'index', as: 'tweets'
post "/tweets", controller: 'tweets', action: 'create'
delete 'tweets/:id', controller: 'tweets', action: 'destroy'
get "/most_popular_tweets", controller: 'tweets', action: 'mostpop', as: 'most_popular_tweets'
get "/least_popular_tweets", controller: 'tweets', action: 'leastpop', as: 'least_popular_tweets'
#resources :tweets

#hashtags
get '/trending', controller: 'trending', action: 'show', as: 'show_trending'

#follow
delete '/follows', controller: 'follows', action: 'destroy', as: 'follows'
resources :follows, :only => [:create]


#likes
resources :likes, :only => [:create, :destroy]

#users
resources :users
get '/:username', controller: 'users', action: 'show', as: 'show_user'
#get '/users', controller: 'users', action: 'index', as: 'users'


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


  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
