Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/', to: 'users#index'
get '/signup',to: 'users#new'
post '/users',to: 'users#create'
get '/users/:id', to: 'users#show'
get '/users/:id/edit', to: 'users#edit'
patch '/users/:id', to: 'users#update'

#sessions route
get '/login',to: 'sessions#new'
post '/login',to: 'sessions#create'
get '/logout',to:'sessions#destroy'

#JobPosts route
get '/jobposts', to: 'jobposts#index'
get '/jobposts/new',to: 'jobposts#new'
post '/jobposts',to: 'jobposts#create'
get '/jobposts/:id', to: 'jobposts#show'
get '/jobposts/:id/edit', to: 'jobposts#edit'
patch '/jobposts/:id', to: 'jobposts#update'
delete '/jobposts/:id', to: 'jobposts#destroy'

#JobApplications route
post '/jobapplications/:id',to: 'jobapplications#create'

end