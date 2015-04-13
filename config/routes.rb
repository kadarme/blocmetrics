Rails.application.routes.draw do
  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end
  
  devise_for :users
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
