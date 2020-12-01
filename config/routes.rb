Rails.application.routes.draw do
  get 'evaluations/new'
  get 'projects/new'
  get 'groups/new'
  get 'users/new'
  get '/addMember',  to:'admins#new'

  root 'user_static_pages#loginPage'
  get 'user_static_pages/projectPage'
  get 'user_static_pages/groupPage'
  get 'user_static_pages/ratingPage'
  post '/loginVal' => 'user_static_pages#loginPageVal'
  post '/addProject' => 'admin_static_pages#valAddProject'
  get '/navAddProj' => 'admin_static_pages#createProjectPage'

  #get 'admin_static_pages/loginPage'
  get 'admin_static_pages/projectPage'
  get 'admin_static_pages/groupPage'
  get 'admin_static_pages/groupMemberPage'
  get 'admin_static_pages/ratingPage'
  #get 'admin_static_pages/studentPage'

  # get '/projectPage',     to: 'user_static_pages#projectPage'
  # get '/groupPage',       to: 'user_static_pages#groupPage'
  # get '/ratingPage',      to: 'user_static_pages#ratingPage'
  # post '/loginVal',       to: 'user_static_pages#loginPageVal'

  resources :users
  post '/users' => 'users#create'
  get '/usersInGroup' => 'users#usersInGroup'
  post '/addUserToGroup' => 'users#addUserToGroup'
  get '/findAvailableUsers' => 'users#findAvailableUsers'
  resources :admins
  resources :groups
  get '/groupsInProject' => 'groups#groupsInProject'
  post '/addGroupToProject' => 'groups#addGroupToProject'
  get '/findAvailableGroups' => 'groups#findAvailableGroups'
  resources :projects
  
  resources :evaluations
end
