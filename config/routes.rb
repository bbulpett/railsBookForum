Rails.application.routes.draw do

  resources :forums do
    resources :topics do
      resources :posts
    end
  end
  # get 'sessions/new'
  resources :sessions
  resources :users

	root 'static#home'
  get 'static/home'
  get 'screencasts' => 'static#media'
  get 'preface' => 'static#preface'
  get 'errata' => 'static#errata'
  get 'examples' => 'static#examples'
  get 'static/share'

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end