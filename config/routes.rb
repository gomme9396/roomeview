Rails.application.routes.draw do
  
  # 메인 화면
  root  'home#main'

  get   'home/main'
  get   'home/index_test'
  
  # 인증메일 다시 보내기
  post  'user/resend_confirmation_path'
  get   'user/resend_confirmation'
  
  # 인증되지 않은 메일로 로그인시 에러
  get   'user/confirmation_error'
  
  # 회원가입
  post  'user/join_path'
  get   'user/join'
  
  # 회원 탈퇴
  get   'review/withdraw/:id' => 'review#withdraw'
  post  'review/user_destroy_path/:id' => 'review#user_destroy_path'
  post  'review/user_all_destroy_path/:id' => 'review#user_all_destroy_path'
  
  # 인증메일로 보내지는 인증 링크
  get   'user/confirmation_path/:email' => 'user#confirmation_path'
  
  # 이미 가입된 회원이 회원가입시 에러
  get   'user/join_error'
  # 비밀번호 2개가 같지 않을 경우 에러
  get   'user/join_error2'
  # 인증메일이 보내졌음을 알리는 창
  get   'user/welcome'
  
  # 로그인
  post  'user/login_path'
  get   'user/login'
  # 가입되지 않은 메일로 로그인시 에러
  get   'user/login_error'
  # 비밀번호가 틀렸을 시 에러
  get   'user/login_error2'
  # 로그아웃
  get   'user/logout'
  
  # 개인정보 변경
  post  'review/edit_password_path/:id' => 'review#edit_password_path'
  get   'review/edit_password/:id' => 'review#edit_password'
  # 개인정보 변경시 현재 비밀번호가 틀렸을 경우 에러 (자동 로그아웃)
  get   'user/edit_error'
  # 개인정보 변경시 새로운 비밀번호가 새로운 비밀번호 인증과 다를 경우 에러
  get   'review/edit_error2'
  
  # 개인정보 삭제
  get   'user/withdraw'
  # UserController에 해당하는 데이타 확인
  get   'user/data'
  
  # 리뷰 작성 안할시 이동
  get   'review/review_error'
  # 리뷰 생성
  get   'review/create'
  post  'review/list_path'
  # 리뷰 업데이트
  post  'review/update_path/:id' => 'review#update_path'
  get   'review/update/:id' => 'review#update'
  #리뷰 삭제
  get   'review/destroy/:id' => "review#destroy"
  # 리뷰 확인
  get   'review/review/:id' => "review#review"
  
  # ReviewController에 해당하는 데이타 확인
  get   'review/data'

  # 리뷰가 등록된 곳 지도로 보여주기
  get   'review/list'
  
  #지역 커뮤니티 확인
  get   'review/review_board/:parcel_address' => "review#review_board"
  # 지역 커뮤니티 보드 작성
  post  'review/review_board_write_path/:id' => 'review#review_board_write_path'
  # get   'review/review_board_write/:parcel_address' => 'review#review_board_write'
  # 지역 커뮤니티 보드 확인
  get   'review/review_board_content'
  get   'review/review_board_content/:id' => 'review#review_board_content'
  # 지역 커뮤니티 보드 수정
  post  'review/review_board_update_path/:id' => 'review#review_board_update_path'
  get   'review/review_board_update/:id' => 'review#review_board_update'
  # 지역 커뮤니티 보드 삭제
  get   'review/review_board_destroy_path/:id' => 'review#review_board_destroy_path'
  
  # 지역 커뮤니티 보드 댓글달기
  post  'review/comment_path/:board_id' => 'review#comment_path'
  # 댓글 수정
  get   'review/comment_update/:id' => 'review#comment_update'
  post  'review/comment_update_path/:id' => 'review#comment_update_path'
  # 댓글 삭제
  get   'review/comment_destroy/:id' => 'review#comment_destroy'
  
  # 지역 기본 계약 정보 확인
  get   'review/review_front/:parcel_address' => "review#review_front"
  
  # 지역 리뷰 목록 확인
  get   'review/review_list/:parcel_address' => "review#review_list"
  
  # 마이페이지
  get   'review/mypage'

  get   'admin/admin_front'
  get   'admin/admin_main'
  get   'admin/admin_review'
  get   'admin/admin_board'
  get   'admin/admin_reply'
  
  # 정보 엑셀파일로 보기
  get   'export/export_user'
  get   'export/export_address'
  get   'export/export_review'
  get   'export/export_board'
  get   'export/export_comment'
  get   'export/export_withdraw'

  get   'user/please'
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
