Rails.application.routes.draw do
  resources :results
  resources :pictures
  resources :questions
  resources :exams
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'signup', to: 'users#new',        as: 'signup'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'statics#home'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
