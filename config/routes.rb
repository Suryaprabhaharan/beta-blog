Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#home'
  get 'about', to: 'page#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'add_comment', to: 'comments#create'
  post 'edit_comment', to: 'comments#edit'
  post 'report_comment', to: 'comments#report'
  post 'add_like', to: 'articles#add_like'
  post 'add_dislike', to: 'articles#add_dislike'
  delete 'logout', to: 'sessions#destroy'
  delete 'delete_comment', to: 'comments#destroy'
  delete 'unreport_comment', to: 'comments#unreport'
  resources :articles
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
