Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/index'
  
  get '/game' => 'pages#game'
  get '/moviedex' => 'pages#moviedex'
  get '/save' => 'pages#save'
  get '/load' => 'pages#load'
  get '/fight' => 'pages#fight'
  get '/off' => 'pages#off'

  get '/up' => 'pages#up'
  get '/down' => 'pages#down'
  get '/right' => 'pages#right'
  get '/left' => 'pages#left'
  get '/buttonb' => 'pages#buttonb'
  get '/buttona' => 'pages#buttona'
  get '/buttonstart' => 'pages#buttonstart'
  get '/buttonselect' => 'pages#buttonselect'

end
