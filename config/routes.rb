Postit::Application.routes.draw do

  root :to => 'posts#index'

  resources :comments, only: :create
  resources :posts, :only => [:index, :show, :new, :create]
  resources :users, :only => [:show, :new, :create]
  resources :sessions, :only => [:create, :destroy]

  match '/posts/voteup/:id' => 'posts#voteup', :as => 'voteup_post'
  match '/posts/votedown/:id' => 'posts#votedown', :as => 'votedown_post'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
end
