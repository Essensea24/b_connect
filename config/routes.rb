Rails.application.routes.draw do

  get "login"             => "sessions#new"
  post "login"            => "sessions#create"
  delete "logout"         => "sessions#destroy"

  # resources :users do 
  #   resources :posts
  # end

  # resources :users do
  #     resources :comments
  
  # end

  # resources :posts do
  #   resources :comments
  # end 

  get "/users/:user_id/comments" => "comments#index", as: :user_comments
  get "/users/:user_id/comments/new" => "comments#new", as: :new_user_comment
  get "/users/:user_id/comments/:id/edit" => "comments#edit", as: :edit_user_comments
  post "/users/:user_id/comments" => "comments#create"
  get "/users/:user_id/comments/:id" => "comments#show", as: :user_comment
  patch "/users/:user_id/comments/:id" => "comments#update"
  delete "/users/:user_id/comments/:id" => "comments#destroy"


  get "/blogs/:blog_id/comments" => "comments#index", as: :blog_comments
  get "/blogs/:blog_id/comments/new" => "comments#new", as: :new_blog_comment
  get "/blogs/:blog_id/comments/:id/edit" => "comments#edit", as: :edit_blog_comments
  post "/blogs/:blog_id/comments" => "comments#create"
  get "/blogs/:blog_id/comments/:id" => "comments#show", as: :blog_comment
  patch "/blogs/:blog_id/comments/:id" => "comments#update"
  delete "/blogs/:blog_id/comments/:id" => "comments#destroy"

  
  get "users/:user_id/blogs"  => "blogs#index", as: :user_blogs
  get "users/:user_id/blogs/new"  => "blogs#new", as: :new_user_blog
  get "users/:user_id/blogs/:id"  => "blogs#show", as: :user_blog
  post "users/:user_id/blogs" => "blogs#create"
  get "users/:user_id/blogs/:id/edit" => "blogs#edit", as: :edit_user_blog
  patch "users/:user_id/blogs/:id" => "blogs#update" 
  delete "users/:user_id/blogs/:id" => "blogs#destroy"
  

  root 'blogs#index'


  get "blogs/"            => "blogs#index"
  get "blogs/new"         => "blogs#new",     as: :new_blog
  get "blogs/:id"         => "blogs#show",    as: :blog
  post "blogs/"           => "blogs#create"
  get "blogs/:id/edit"    => "blogs#edit",    as: :edit_blog
  patch "blogs/:id"       => "blogs#update",  as: :update_blog
  delete "blogs/:id"      => "blogs#destroy"
  


  # users rest
  get "users/"            => "users#index"
  get "users/new"         => "users#new",     as: :new_user
  get "users/:id"         => "users#show",    as: :user
  post "users/"           => "users#create"
  get "users/:id/edit"    => "users#edit",    as: :edit_user
  patch "users/:id"       => "users#update",  as: :update_user
  delete "users/:id"      => "users#destroy"
  get "users/:id/my_blogs"          => "users#my_blogs", as: :my_blogs
  get "users/:id/page" => "users#user_page", as: :user_page
  



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
