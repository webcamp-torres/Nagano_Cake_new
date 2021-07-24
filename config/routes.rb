Rails.application.routes.draw do
  get '/search', to: 'search#search'
  post "/admin/items/admin_items_path" => "items#index"
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'member/edit' => 'members#edit'
  get '/admins' => 'admin/homes#top'
  patch 'members' => 'members#update'

  devise_for :members, controllers: {
       sessions:      'members/sessions',
       passwords:     'members/passwords',
       registrations: 'members/registrations'

     }

    scope module: 'public' do
      post '/orders/confirm' => 'orders#confirm'
      get '/orders/complete' => 'orders#complete'
      resources :items
      get 'members/my_page' => 'members#my_page'
      resources :members,only: [:show,:edit,:update]  do
        collection do

          get 'unsubscribe'
          patch 'unsubscribe_status' => 'members#unsubscribe_status'
        end
      end

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
      resources :members, only: [:index, :show, :edit, :update ]
      get 'admin/members' => 'members#index'
      resources :order_items, only: [:update]
   end

     devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
     }


end
