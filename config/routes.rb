Rails.application.routes.draw do
  root "blog_posts#index"
  
  resources :blog_posts
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
