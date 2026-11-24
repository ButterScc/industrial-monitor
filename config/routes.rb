Rails.application.routes.draw do
  resources :equipment
  get "dashboard/index"
  root "dashboard#index"

  resources :equipments
  resources :sensors
  resources :alerts

  namespace :api do
    namespace :v1 do
      post "sensors/:sensor_id/readings",
           to: "readings#create"
    end
  end
end