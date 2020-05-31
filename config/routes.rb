Rails.application.routes.draw do

  post 'sessions/create'
  delete 'sessions/destroy'
  get 'news_field', to: 'news#index'
  root 'home#top'
  get 'test', to: 'news#test'
  get 'teachers/:id', to: "teachers#show"
  get 'news/new_msg'

  get 'new_lh', to: "news#new_learning_history"
  post 'create_lh', to: "news#create_learning_history"
  post 'create_msg', to: "news#create_message"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
