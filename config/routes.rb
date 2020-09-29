Rails.application.routes.draw do
  get 'student_sign_up', to: 'home#student_sign_up'
  get 'teacher_sign_up', to: 'home#teacher_sign_up'
  post 'student_users/create', to: 'students#create'
  post 'teacher_users/create', to: 'teachers#create'
  post 'students/add', to: 'students#add'
  delete 'students/:student_id/unfasten', to: 'students#unfasten'

  get 'students/index'
  get 'students/new'
  get 'students/edit', to: 'students#edit'
  get 'news_field/:id/edit', to: 'news#edit_lh'
  post 'news_field/:id/update', to: 'news#update_lh'
  post 'sessions/create'
  delete 'sessions/destroy'
  get 'news_field', to: 'news#index'
  root 'home#top'
  get 'teacher_sign_up', to: 'home#teacher_sign_up'
 
  get 'test', to: 'news#test'
  get 'teachers/edit'
  post 'teachers/update'
  post 'students/update'
  get 'students/history', to: "students#history"
  get 'teachers/history', to: 'teachers#history'

  get 'students/new_exam', to: "students#new_exam"

  get 'students/show_test', to: 'students#show_test'
  get 'teachers/show_test', to: 'teachers#show_test'
  delete '/teachers/show_test/:id', to: 'teachers#delete_test'
  get 'teachers/edit_test', to: 'teachers#edit_test'

  get 'teachers/show_calender/:id', to: 'teachers#show_calender'

  get 'each_student/:id', to: 'teachers#each_student'

  
  get 'teachers/:id', to: "teachers#show"
  get 'news/new_msg'
  get 'students/show_calender', to: 'students#show_calender'
  get 'students/:id', to: 'students#show'

  get 'new_lh', to: "news#new_learning_history"
  post 'create_lh', to: "news#create_learning_history"
  post 'ajax_create_lh', to: "news#ajax_create_learning_history"
  delete 'destroy_lh/:id', to: "news#destroy_lh"

  delete 'destroy_q/:id', to: "questions#delete"
  delete 'destroy_r/:id', to: "replies#delete"

  post 'teachers/ajax_create_test', to: 'teachers#ajax_create_test'
  

  post 'create_msg', to: "news#create_message"
  get 'each_events/:id', to: "events#each_events"
  # get 'sample', to: "teachers#sample"
  # post 'sample', to: "teachers#sample"

  get 'replies/:question_id/new', to: "replies#new"

  resources :events
  resources :messages
  resources :exams, only: [:index, :create, :new, :edit, :show]
  resources :questions, only: [:new, :create]
  resources :replies, only: [:new, :create]
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
