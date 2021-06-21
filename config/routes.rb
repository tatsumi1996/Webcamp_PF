Rails.application.routes.draw do
  resources :events
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index,:show,:edit,:update]
  get '/user/:id/quit' => 'users#quit', as: 'quit'
  patch '/users/:id/out' => 'users#out', as: 'users_out'
  
  resources :supports, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
  end
  
  namespace :admin do
    resources :favorite_teams, only: [:index, :create, :edit, :update]
  end
  
  root to: 'homes#top'
  get 'homes/top'
  get 'homes/about'
  
  
end
