Rails.application.routes.draw do

  resources :posts
  resources :topics
  resources :forums
  # get 'sessions/new'
  resources :sessions

  resources :users
	root 'static#home'

  get 'static/home'

  get 'static/praise'

  get 'static/preface'

  get 'static/errata'

  get 'static/examples'

  get 'static/share'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
