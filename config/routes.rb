Rails.application.routes.draw do

  get 'students/index'
  get 'students/new'
  get 'students/edit'
  post 'sessions/create'
  delete 'sessions/destroy'
  get 'news_field', to: 'news#index'
  root 'home#top'
  get 'test', to: 'news#test'
  get 'teachers/edit'
  post 'teachers/update'
  get 'history', to: "students#history"
  get 'teachers/:id', to: "teachers#show"
  get 'news/new_msg'
  get 'students/show_test', to: 'students#show_test'
  get 'students/show_calender', to: 'students#show_calender'
  get 'students/:id', to: 'students#show'

  get 'new_lh', to: "news#new_learning_history"
  post 'create_lh', to: "news#create_learning_history"
  post 'ajax_create_lh', to: "news#ajax_create_learning_history"
  post 'create_msg', to: "news#create_message"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
