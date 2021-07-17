Rails.application.routes.draw do
    namespace :admin do
   end
     devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
     }
     devise_for :members, controllers: {
       sessions:      'members/sessions',
       passwords:     'members/passwords',
       registrations: 'members/registrations'
     }
     get 'homes/top'
     root to: 'homes#top'

end
