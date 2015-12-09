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

  namespace :supervisor do
    root "courses#index"
    resources :subjects
    resources :courses  do
      resources :course_subjects
    end
   end
end
