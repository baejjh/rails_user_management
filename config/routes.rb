Rails.application.routes.draw do
  root 'users#index'

  get 'users/index'

  get 'users/new'
  post 'users/create'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'
end