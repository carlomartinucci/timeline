Rails.application.routes.draw do
  resources :involvements
  resources :nop_evidences
  resources :yes_evidences
  resources :claims
  resources :sources
  resources :jobs
  resources :people
  devise_for :users

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
