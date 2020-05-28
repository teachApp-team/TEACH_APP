Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'news_field', to: 'news#index'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
