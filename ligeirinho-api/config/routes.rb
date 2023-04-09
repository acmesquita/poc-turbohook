Rails.application.routes.draw do
  post '/customers', to: 'customers#create'
  post '/customers/:customer_id/orders', to: 'orders#create'
  post '/customers/:customer_id/webhooks', to: 'webhooks#create'
end
