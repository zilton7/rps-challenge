Rails.application.routes.draw do
  get 'play/choose/', to: 'play#choose'
  root to: 'play#choose'
end
