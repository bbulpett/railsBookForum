Rails.application.routes.draw do

  use_doorkeeper
  resources :forums do
    resources :topics do
      resources :posts
    end
  end
  # get 'sessions/new'
  resources :sessions, :users

  get 'static/home'
  get 'screencasts' => 'static#media'
  get 'preface' => 'static#preface'
  get 'errata' => 'static#errata'
  get 'examples' => 'static#examples'
  get 'static/share'

  mount Ckeditor::Engine => '/ckeditor'

  root 'static#home'
end