Rails.application.routes.draw do
  resources :todos, only: %i[index create update destroy]
end
