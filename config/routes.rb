Rails.application.routes.draw do
  #root 'welcome#index'
  root 'articles#index'

  resources :articles do
    resources :comments
  end
end
