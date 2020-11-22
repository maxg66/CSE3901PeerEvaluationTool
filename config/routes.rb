Rails.application.routes.draw do
  get 'user_static_pages/loginPage'
  get 'user_static_pages/projectPage'
  get 'user_static_pages/groupPage'
  get 'user_static_pages/ratingPage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
