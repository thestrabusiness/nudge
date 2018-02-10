Rails.application.routes.draw do
  resources :nudges
  root 'nudges#index'
end
