Rails.application.routes.draw do
  post '/customers', to: 'customers#create'
  post '/customers/:customer_id/orders', to: 'orders#create'
  put '/customers/:customer_id/orders/:order_id/init_delivery', to: 'orders#init_delivery'
  put '/customers/:customer_id/orders/:order_id/finish_delivery', to: 'orders#finish_delivery'
  post '/customers/:customer_id/webhooks', to: 'webhooks#create'
end
