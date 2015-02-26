Rails.application.routes.draw do
  resources :subjects do
    resources :tasks
  end
end
