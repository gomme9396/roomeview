Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root  'home#index'
  
  # get   ':controller(/:action(/:id))'
  # post  ':controller(/:action(/:id))'

  get   'home/index'
  
  get   'home/create_a'
  get   'home/create_b'
  get   'home/create_c'
  
  post  'home/list_path_a'
  post  'home/list_path_b'
  
  get   'home/list_find'
  post  'home/list_find'
  
  get   'home/mypage'
  
  get   'home/review/:address_id' => "home#review"
  
  get   '/destroy/:address_id' => "home#destroy"
  get   '/destroy_image/:address_id/:image_id' => "home#destroy_image"
  
  get   '/update_view_a/:address_id' => "home#update_view_a"
  get   '/update_view_b/:address_id' => "home#update_view_b"
  
  post  '/update_a/:address_id' => "home#update_a"
  post  '/update_b/:address_id' => "home#update_b"
  
  post  'home/find'
  post  'home/review_path'
  
  # get   'home/list/:address_id' => "home#list"
  
  get   'home/review'
  
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
