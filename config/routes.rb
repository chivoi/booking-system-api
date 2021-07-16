Rails.application.routes.draw do
  scope '/api' do
    get '/my_bookings', to: 'bookings#user_bookings'
    get '/bookings', to: 'bookings#all_bookings'
    post '/bookings', to: 'bookings#create'
    get '/bookings/:id', to: 'bookings#show'
    patch '/bookings/:id', to: 'bookings#update'
    delete '/bookings/:id', to: 'bookings#destroy'
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/log_in', to: 'users#log_in'
    end
  end
end