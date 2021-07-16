Rails.application.routes.draw do
  scope '/api' do

    scope '/auth' do
      post '/sign_up', to: 'users#create'
    end
  end
end
