Rails.application.routes.draw do
  # get 'home/index'

  root 'home#index'

  resources :posts
  resources :articles
  get "articles/crawling" => "articles#crawling", as: "crawling_articles"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
