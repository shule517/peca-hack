Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :circles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :projects do
  #   resources :tasks, only: [:create, :destroy]
  # end

  # post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'

  root 'circles#index'
end
