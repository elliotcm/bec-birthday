Rails.application.routes.draw do
  resources :prizes do
    member do
      get :choose_or_reject
      post :choose
      post :reject
    end

    collection do
      post :reveal
    end
  end

  root "prizes#index"
end
