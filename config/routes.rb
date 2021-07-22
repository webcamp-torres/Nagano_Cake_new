Rails.application.routes.draw do
  get '/search', to: 'search#search'
  post "/admin/items/admin_items_path" => "items#index"
      root to: 'homes#top'
      get '/about' => 'homes#about'

  devise_for :members, controllers: {
       sessions:      'members/sessions',
       passwords:     'members/passwords',
       registrations: 'members/registrations'
     }

    scope module: 'public' do
      post '/orders/confirm' => 'orders#confirm'
      get '/orders/complete' => 'orders#complete'
      resources :items
      resources :members
      resources :cart_items
      # post '/update_item' => 'cart_items#update_item'
      delete '/delete_all' => 'cart_items#delete_all'
      resources :orders
      resources :deliveries
    end


    namespace :admin do
      resources :items, except: [:destroy]
      resources :orders, only: [:show, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :members, only: [:index, :show, :edit, :update]
      resources :order_items, only: [:update]
   end

     devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
     }


end
