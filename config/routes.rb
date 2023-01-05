Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root to: 'web/boards#show'

  scope module: :web do
    resource :board, only: :show
    resource :session, only: %i[new create destroy]
    resources :developers, only: %i[new create]
    resource :password_resets, only: %i[new create edit update]
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :tasks, only: %i[index show create update destroy]
      resources :users, only: %i[index show]
    end
  end
end
