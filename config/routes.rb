Rails.application.routes.draw do
  devise_for :members
  use_doorkeeper_openid_connect
  use_doorkeeper

  get "/userinfo",
      to: "openid_connect/userinfo#show"

  namespace :api do
    namespace :v1 do
      resources :members, only: [] do
        resources :registrations, only: [:index]
      end

      resources :profiles, only: [] do
        resources :certifications, only: [:create]
      end

      resources :certifications, only: [] do
        resources :activities,
                  only: [:create],
                  controller: "certification_activities"
      end
    end
  end
end
