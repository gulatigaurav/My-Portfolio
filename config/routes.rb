Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_display' # CUSTOM ROUTES FOR resources
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact',to: 'pages#contact'
  get '/rails_tweets',to: 'pages#rails_news'
  get 'portfolios/angular'
  # resources :blogs do
  #   member do
  #      get :toggle_status
  #    end
  # end
  resources :blogs, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
