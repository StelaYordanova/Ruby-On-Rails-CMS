
Rails.application.routes.draw do
  root 'public/home#index'

    namespace :public do
      resources :categories, only: [:show]
      resources :books, only: [:show]
    end

  devise_for :users
  namespace :cms do
    resources :authors
    get 'books/search', to: 'books#search', as: :search_books
    resources :books
    resources :categories

  end
    delete '/cms/authors/:id', to: 'cms/authors#destroy', as: 'destroy_cms_author'
    delete '/cms/books/:id', to: 'cms/books#destroy', as: 'destroy_cms_book'
end
