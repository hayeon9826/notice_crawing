Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'

  root 'home#index'

  resources :posts
  resources :articles
  resources :home
  get "articles/crawling" => "articles#crawling", as: "crawling_articles"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
