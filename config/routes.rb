Rails.application.routes.draw do

  get 'photos/create'
  get 'photos/destroy'
  resources :proyectos do
    resources :photos, only: [:create, :destroy]
  end
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
