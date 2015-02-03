Rails.application.routes.draw do

  	root 'users#index'

  	get 'users/index'
  	get 'users/new'
  	get 'users/:id' 		=> 'users#show'
  	get 'users/:id/edit' 	=> 'users#edit'

  	post 'users/create'
  	patch 'users/:id' 		=> 'users#update'
  	delete 'users/:id' 		=> 'users#destroy'

end