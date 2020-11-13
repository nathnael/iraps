Rails.application.routes.draw do 
  

  resources :invoices
 scope "(:locale)", locale: /en|am/ do

  resources :vendors

  resources :permissions
  resources :role_types
  get 'setting/index'
  devise_for :users

  get "home/index"
  get "home/minor"
  get "home/other"

  resources :users
  resources :roles

  get 'users/:id/user_preference', to: 'users#user_preference'

  put 'users/:id/updateUserPreference', to: 'users#updateUserPreference'

  get 'users/:id/roles', to: 'users#roles'

  put 'users/:id/updateRoles', to: 'users#updateRoles'

  put 'users/:id/updateDepartments', to: 'users#updateDepartments'

  get 'users/:id/user_departments', to: 'users#user_departments'

  put 'users/:id/updatePermissions', to: 'users#updatePermissions'

  get 'users/:id/user_permissions', to: 'users#user_permissions'

  put 'users/:id/updateDepartmentPermission', to: 'users#updateDepartmentPermission'
    
  root to: 'dashboard#index'
  # GraphQL configuration
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  resources :queries
end

end
