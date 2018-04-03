Rails.application.routes.draw do

  resources :clients do
    resources :docs
  end

  root "pages#home"

end
