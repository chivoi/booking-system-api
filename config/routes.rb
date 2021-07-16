Rails.application.routes.draw do
  scope '/api' do

    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/log_in', to: 'users#log_in'
    end
  end
end
