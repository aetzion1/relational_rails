Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  resources :sections do
    resources :instruments
  end

  get '/', to: 'welcome#index'

  get '/sections', to: 'sections#index'
  get '/sections/new', to: 'sections#new'
  get '/sections/:id', to: 'sections#show'
  post '/sections', to: 'sections#create'
  get '/sections/:id/edit', to: 'sections#edit'
  patch '/sections/:id', to: 'sections#update'
  delete '/sections/:id', to: 'sections#destroy'

  get '/instruments', to: 'instruments#index'
  get '/sections/:id/instruments', to: 'instruments#index'
  get '/sections/:id/instruments/new', to: 'instruments#new'
  post '/sections/:id/instruments', to: 'instruments#create'
  get '/instruments/:id', to: 'instruments#show'
  # get '/sections/:id/instruments', to: 'instruments#list'

  get '/orchestras', to:'orchestras#index'
end