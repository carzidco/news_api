Rails.application.routes.draw do
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  get '/articles/search/:query', to: 'articles#search'
end
