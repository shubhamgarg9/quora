Rails.application.routes.draw do

  root 'pages#home'
  get 'home' => 'pages#home'

  resources :questions do
  	member do
  		post 'follow_question'
      post 'upvote'
  	end
  end

  resources :answrs

  resources :users, except: [:new]
  get '/register' => 'users#new'

  get 'login' => 'logins#new'
  post 'login' => 'logins#create'
  get 'logout' => 'logins#destroy'
  
end
