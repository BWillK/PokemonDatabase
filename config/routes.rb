Rails.application.routes.draw do
  root to: 'welcome#index'
  root 'pages#main'

  get 'search', to: 'search#index', as: 'search'

  resources :abilities
  resources :types
  resources :pokemons
  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end