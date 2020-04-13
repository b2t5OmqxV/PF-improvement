Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }

  scope module: :users do
    root 'homes#top'
  end

    resources :users, only: [:index, :show, :edit, :update]
    resources :appliances
    get 'appliances/top' => 'appliances#top'

   devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
