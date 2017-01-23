Rails.application.routes.draw do

  root  'home#main'

  get   'home/main'
  get   'home/index_test'
  
  post  'user/join_path'
  get   'user/confirmation_path/:email' => 'user#confirmation_path'
  get   'user/join'

  get   'user/join_error'
  get   'user/welcome'

  post  'user/login_path'
  get   'user/login'

  get   'user/login_error'

  get   'user/logout'

  post  'user/edit_path/:id' => 'user#edit_path'
  get   'user/edit/:id' => 'user#edit'
  get   'user/withdraw'

  get   'user/data'

  get   'review/create'
  get   'review/data'

  post  'review/list_path'
  get   'review/list'
  # get   'review/review_front'
  get   'review/review_list'
  # get   'review/review_board'
  
  post  'review/review_board_write_path'
  get   'review/review_board_write/:parcel_address' => 'review#review_board_write'
  get   'review/review_board_content'

  get   'review/review/:id' => "review#review"
  get   'review/review_front/:parcel_address' => "review#review_front"
  get   'review/review_list/:parcel_address' => "review#review_list"
  get   'review/review_board/:parcel_address' => "review#review_board"

  post  'review/update_path/:id' => 'review#update_path'
  get   'review/update/:id' => 'review#update'

  get   'review/destroy/:id' => "review#destroy"

  get   'review/mypage'

  get   'admin/admin_main'
  get   'admin/admin_review'
  get   'admin/admin_board'
  get   'admin/admin_reply'

  get   'export/export_review'
  get   'export/export_user'


  # get   'review/destroy_image1/:address_id' => "home#destroy_image1"
  # get   'review/destroy_image2/:address_id' => "home#destroy_image2"
  # get   'review/destroy_image3/:address_id' => "home#destroy_image3"
  # get   'review/destroy_image4/:address_id' => "home#destroy_image4"


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
