Rails.application.routes.draw do
  get 'search/search'
  post "/admin/items/admin_items_path" => "items#index"
      root to: 'homes#top'
  
  devise_for :members, controllers: {
       sessions:      'members/sessions',
       passwords:     'members/passwords',
       registrations: 'members/registrations'
     }

    scope module: 'public' do
      get '/about' => 'homes#about'
      resources :items
      resources :members
      resources :cart_items
      resources :orders
      resources :deliveries
      get 'searches' => 'searches#search'
    end


    namespace :admin do
      resources :items, except: [:destroy]
      resources :orders, only: [:show, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :members, only: [:index, :show, :edit, :update]
      resources :order_items, only: [:update]
      get 'searches' => 'searches#search'
   end

     devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
     }


end
