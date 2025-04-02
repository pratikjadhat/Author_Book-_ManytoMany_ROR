Rails.application.routes.draw do
  # Define custom routes
  get 'home/index'  # This is for your HomeController index action

  # Root route (can be changed to another page like authors#index or books#index)
  root 'home#index'  # If you want the homepage to be "home#index"
  # root 'authors#index'  # If you want the homepage to be "authors#index"
  # root 'books#index'  # If you want the homepage to be "books#index"

  # Custom route for best_library page
  get 'best_library', to: 'home#best_library'

  # config/routes.rb
  get 'about', to: 'home#about'


  # API routes (versioned API for authors and books)
  namespace :api do
    namespace :v1 do
      resources :authors, only: [:index, :create, :show, :update, :destroy]
      resources :books, only: [:index, :create, :show, :update, :destroy]
    end
  end

  # Resource routes for authors and books
  resources :authors
  resources :books

  # Uncomment and edit this line if you want a different homepage like Authors index
  # root 'authors#index'  # Uncomment this if you want the homepage to display authors list
  # root 'books#index'  # Uncomment this if you want the homepage to display books list
end
