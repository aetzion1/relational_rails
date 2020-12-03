Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/sections', to: 'sections#index'
  get '/sections/:id', to: 'sections#show'
  post '/sections', to: 'sections#create'
  get '/sections/new', to: 'sections#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
