Rails.application.routes.draw do

  post 'sessions/create'
  delete 'sessions/destroy'
  get 'news_field', to: 'news#index'
  root 'home#top'
  get 'test', to: 'news#test'
  get '/teachers/:id', to: "teachers#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
