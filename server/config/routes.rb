Rails.application.routes.draw do
  get 'ping', to: 'application#ping'
  get 'ping_stream', to: 'application#ping_stream'
end

