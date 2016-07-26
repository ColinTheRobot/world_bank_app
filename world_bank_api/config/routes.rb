Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/wb_info/count', to: 'wb_info#count'
  get '/wb_info/unique_regions', to: 'wb_info#unique_regions'
  get '/wb_info/by_name/:name', to: 'wb_info#by_name'
  resources :wb_info, only: [:create]

end
