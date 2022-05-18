Rails.application.routes.draw do
  get 'play/choose', to: 'play#choose'
  # resources :play, only: [:choose] do
  #   member do
  #     get :choose
  #   end
  # end
end
