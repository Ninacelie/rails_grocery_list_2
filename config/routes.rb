Rails.application.routes.draw do

  resources :users do 
    resources :lists, only: [:new,:create,:index] # shallow routing 
  end 
  
  resources :lists do
    resources :items, only: [:new, :create, :index]
  end 

  resources :items
  resources :list_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
