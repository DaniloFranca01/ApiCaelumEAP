Rails.application.routes.draw do
  root to: "static#home"
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  resources :pacientes do
    resources :registros do
      resources :resultados
    end
  end
  resources :escalas do
    resources :interpretacoes
    resources :parametros do
      resources :respostas
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
