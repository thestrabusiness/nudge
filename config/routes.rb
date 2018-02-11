Rails.application.routes.draw do
  resources :nudges
  get 'nudges/:nudge_id/nudge', to: 'nudges#nudge', as: :send_nudge
  root 'nudges#index'
end
