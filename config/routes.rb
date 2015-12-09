Rails.application.routes.draw do
  root "static_page#home"
  get "static_page/about"
  get "login"   => "sessions#new"
  post "login"  =>   "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :courses do
    resources :subjects
  end
end
