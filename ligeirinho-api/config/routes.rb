Rails.application.routes.draw do
  resource :customers, only: [:create]
end
