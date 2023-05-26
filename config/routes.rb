
Rails.application.routes.draw do
  namespace :cms do
    resources :authors
    resources :books
    resources :categories
    resources :books, only: [:show]

  end
    delete '/cms/authors/:id', to: 'cms/authors#destroy', as: 'destroy_cms_author'
    get 'books/search', to: 'books#search'

end
