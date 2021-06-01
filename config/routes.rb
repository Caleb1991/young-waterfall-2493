Rails.application.routes.draw do
  resources :studios

  resources :movies

  resources :actors
end
