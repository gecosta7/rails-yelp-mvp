Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "controller#action"
get "restaurants/:restaurant_id/reviews", to: "reviews#index"
get "reviews/:id", to: "reviews#show"
get "reviews/:id/edit", to: "reviews#edit"
patch "reviews/:id",                          to: "reviews#update"
delete "reviews/:id",                         to: "reviews#destroy"
end
end

