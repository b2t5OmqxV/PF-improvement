Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }

  scope module: :users do
    root 'homes#top'
    resources :notices, only: [:show]
    resources :users, only: [:index, :show, :edit, :update]
    get 'appliances/top' => 'appliances#top'
    resources :appliances, except: :new
  end

   devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    get 'top' => 'notices#new'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :appliances, only: [:index, :show, :edit, :update, :destroy]
    resources :categories, only: [:create, :index, :edit, :update, :destroy]
    resources :notices, only: [:create, :index, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
