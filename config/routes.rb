Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  devise_for :users
  root to: 'pages#home'

  get "pages/download_pdf"


  namespace :admin do
    get '', action: 'index', as: '/'
    resources :projects, except: :show
    resources :skills, except: :show
  end

  resources :projects, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
