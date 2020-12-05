Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/sections', to: 'sections#index'
  get '/sections/:id', to: 'sections#show', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  get '/sections/new', to: 'sections#new'
  post '/sections', to: 'sections#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
