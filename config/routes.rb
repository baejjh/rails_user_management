Rails.application.routes.draw do
  root 'users#index'

  get 'users/index'

  get 'users/new'
  post 'users/create'

end