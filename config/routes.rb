Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do

    resources :tracelogs, only: [:create]
    resources :events,    only: [:index, :show]
    resources :alarms,    only: [:index, :show]

  end

  get 'track', to: 'tracelogs#create'


end
