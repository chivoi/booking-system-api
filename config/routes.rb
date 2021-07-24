Rails.application.routes.draw do
  scope '/api' do
    get '/my_bookings', to: 'bookings#user_bookings'
    get '/bookings', to: 'bookings#all_bookings'
    post '/bookings', to: 'bookings#create', as: 'create_booking'
    get '/bookings/:id', to: 'bookings#show'
    patch '/bookings/:id', to: 'bookings#update'
    delete '/bookings/:id', to: 'bookings#destroy'

    get '/my_details', to: 'clients#my_details'
    patch '/my_details', to: 'users#update'
    get '/clients', to: 'clients#index'
    delete '/my_details', to: 'users#destroy'
    get 'clients/:id', to: 'clients#show'
    get 'clients/:id/bookings', to: 'clients#client_bookings'

    get '/timeslots', to: 'timeslots#index'
    get '/blocked_timeslots', to: 'timeslots#blocked_timeslots'
    patch '/edit_availability', to: 'timeslots#update'
    get '/timeslots/:id', to: 'timeslots#show'
    post '/timeslots/get_by_params', to: 'timeslots#get_by_params'

    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/log_in', to: 'users#log_in'
    end
  end
end