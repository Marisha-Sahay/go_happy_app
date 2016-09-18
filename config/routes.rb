Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/', to: 'users#home'
get '/signup',to: 'users#new'
post '/users',to: 'users#create'
get '/users', to: 'users#index'
get '/users/:id', to: 'users#show'
get '/users/:id/edit', to: 'users#edit'
patch '/users/:id', to: 'users#update'
delete '/users/:id/delete', to: 'users#destroy'
post '/users/search', to: 'users#search'
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
post '/jobposts/search', to: 'jobposts#search'
#JobApplications route
post '/jobapplications/:id',to: 'jobapplications#create'

#Profile routes
get '/profile/new',to: 'profiles#new'
get '/profile', to: 'profiles#index'
post '/profile',to: 'profiles#create'
get '/profile/:id', to: 'profiles#show'
get '/profile/:id/edit', to: 'profiles#edit'
patch '/profile/:id', to: 'profiles#update'
get '/profiles', to: 'profiles#index'

mount Messenger::Bot::Space => "/webhook"
end
