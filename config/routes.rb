Rails.application.routes.draw do
  


  get "login"             => "sessions#new"
  post "login"            => "sessions#create"
  delete "logout"         => "sessions#destroy"

  get "users/:user_id/blogs"  => "blogs#index", as: :user_blogs
  get "users/:user_id/blogs/new"  => "blogs#new", as: :new_user_blog
  get "users/:user_id/blogs/:id"  => "blogs#show", as: :user_blog
  post "users/:user_id/blogs" => "blogs#create"
  get "users/:user_id/blogs/:id/edit" => "blogs#edit", as: :edit_user_blog
  patch "users/:user_id/blogs/:id" => "blogs#update" 
  delete "users/:user_id/blogs/:id" => "blogs#destroy"
  

  root 'sessions#new'


  # users rest
  get "users/"            => "users#index"
  get "users/new"         => "users#new",     as: :new_user
  get "users/:id"         => "users#show",    as: :user
  post "users/"           => "users#create"
  get "users/:id/edit"    => "users#edit",    as: :edit_user
  patch "users/:id"       => "users#update",  as: :update_user
  delete "users/:id"      => "users#destroy"
  



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
