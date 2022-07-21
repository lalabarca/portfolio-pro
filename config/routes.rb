Rails.application.routes.draw do

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
