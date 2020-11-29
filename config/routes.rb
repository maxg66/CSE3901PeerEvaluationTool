Rails.application.routes.draw do
  resources :groups
  root 'user_static_pages#loginPage'
  get 'user_static_pages/projectPage'
  get 'user_static_pages/groupPage'
  get 'user_static_pages/ratingPage'
  post '/loginVal' => 'user_static_pages#loginPageVal'
  #get 'admin_static_pages/loginPage'
  get 'admin_static_pages/projectPage'
  get 'admin_static_pages/groupPage'
  get 'admin_static_pages/groupMemberPage'
  get 'admin_static_pages/ratingPage'
  #get 'admin_static_pages/studentPage'
end
