Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/questions#index'
  namespace :admin, defaults: {format: 'html'} do
    resources :questions
    get 'questions/all/:view', to: 'questions#index'
  end

  resources :questions
end
