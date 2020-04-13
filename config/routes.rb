Rails.application.routes.draw do

  devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users

    scope module: :users do
      root 'appliances#top'
    end

    resources :users, only: [:index, :show, :edit, :update]
    resources :appliances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
