Rails.application.routes.draw do
  root 'user_static_pages#loginPage'
  get 'user_static_pages/projectPage'
  get 'user_static_pages/groupPage'
  get 'user_static_pages/ratingPage'
end
