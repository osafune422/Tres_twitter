Rails.application.routes.draw do
  post "like/:tweet_id" => "likes#like"
  post "like/destroy/:tweet_id" => "likes#destroy"
  
  get 'show/:id', to: 'tweets#show'
  get 'tweets/new', to: 'tweets#new_tweet'
  post 'tweet', to: 'tweets#tweet'
  
  get 'tweets/timeline'
  get 'mypage/:id/:login_id', to:'users#mypage'
  get 'signup', to:'users#new'
  post 'create', to: 'users#create'
  get 'edit/:id', to:'users#edit'
  post 'update/users/:id', to:'users#update'
  get 'login', to: 'users#login_form'
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
