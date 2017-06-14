Rails.application.routes.draw do
  root to: 'users#index'

  get 'comments' => 'comments#index'
  get 'cuicuis' => 'cuicuis#index'
  get 'likes' => 'likes#index'
  get 'users' => 'users#index'

end
