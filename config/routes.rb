Rails.application.routes.draw do
  root 'events#index'

  devise_for :users, controllers: { registrations: 'users/registrations' , sessions: 'users/sessions' }

  resources :events
  resources :users, only: :show
  resources :event_attendances, only: [:create, :destroy]
  resources :event_invites, only: [:new, :create]

  get 'event_attendances', to: 'event_attendances#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
