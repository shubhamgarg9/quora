Rails.application.routes.draw do

  root 'pages#home'
  get 'home' => 'pages#home'

  resources :questions do
  	member do
  		post 'follow_question'
  	end
  end




end
