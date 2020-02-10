Rails.application.routes.draw do
  get '/new(.:format)', to: 'games#new', as: :new
  post 'score(.:format)', to: 'games#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
