Rails.application.routes.draw do

root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers:{registration: 'registrations'}

resources :users, only: [:show]
resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'

    end
resources :photos, only: [:create , :destroy ]
end
end
