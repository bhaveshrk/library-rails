Rails.application.routes.draw do
  resources :books
  resources :authors
  resources :loaned_books do 
    collection do
      get :your_loaned_book
    end
  end
  devise_for :users
  # get 'library/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'loaned_books#index'
  get 'loaned_books/your_loaned_book/:book' => 'loaned_books#change_status'
  # Defines the root path route ("/")
  # root "articles#index"
end
