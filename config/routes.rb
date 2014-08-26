BCAPI::Application.routes.draw do

  scope module: :api, defaults: { format: 'json'} do
    namespace "v1" do
      
      resources :challenges, only: [:create, :update, :destroy, :show] do
        resources :users, only: [:index]
      end

      resources :workouts, only: [:create, :show]
      
      resources :users, only: [:create, :update, :destroy, :show] do
      end

      match '/challenges/:challenge_id/workouts' => 'workouts#challenge_index', :via => :get
      match '/users/:user_id/workouts' => 'workouts#user_index', :via => :get

    end
  end

end