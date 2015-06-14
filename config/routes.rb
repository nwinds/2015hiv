Rails.application.routes.draw do



  get 'admin/index', to: 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # todo: clean these three routes later
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # 

  resources :users

  resources :orders

  resources :line_items do
    collection do
      # delete 'destroy'
      post 'minus_down', to: 'line_items#minus_down'
    end
    # match 'destroy', to: 'line_items#destroy', via: [:delete]
    # delete 'destroy', to: 'line_items#destroy'
  end

  resources :wishlists
  

  get 'store/index'

  # match 'line_items', to: 'line_items#edit', via: [:put]
  match 'line_items', to: 'line_items#destroy', via: [:delete]


# for testing only
  # resources :comments do
  #   match 'edit', to: 'comments#update', via: :all
  #   match '/comments/:id/', to: 'comments#update', via: [:post]

  # end



  resources :products do
    get :who_bought, :on => :member
    # match 'upload', to: 'products#upload', via: [:get]
    resources :comments
      # get 'comments/:id', as: :comments
      match 'comments/:id/edit', to: 'comments#update', via: [:post]
      match 'comments/:id/', to: 'comments#update', via: [:post]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'store#index', :as => 'store'

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
