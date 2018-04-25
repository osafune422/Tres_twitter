Rails.application.routes.draw do
  get 'mypage/:id/:login_id', to:'users#mypage'
  get 'edit/:id/', to:'users#edit'
  post 'update/users/:id', to:'users#update'
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
