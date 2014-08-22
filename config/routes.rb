BCAPI::Application.routes.draw do

  scope module: :api, defaults: { format: 'json'} do
    namespace "v1" do
      
      resources :challenges, only: [:create, :update, :destroy, :show] do
        resources :workouts, only: [:index]
        resources :users, only: [:index]
      end

      resources :workouts, only: [:create, :show]
      
      resources :users, only: [:create, :update, :destroy, :show] do
        resources :workouts, only: [:index]
      end

    end
  end

end