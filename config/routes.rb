Rails.application.routes.draw do
  # Trying to add api/vi to query string. Not working properly though, so leaving off for now.
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    # scope module: :v1 do
      resources :orgs, only: [:create, :show] do
        resources :events, only: [:create, :index]
      end
    # end
  # end
end
