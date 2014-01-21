Blog::Application.routes.draw do
  #get "welcome/index"
  #root 'welcome#index'
  resources :posts do
    resources :comments  # comments is a nested resource within posts
  end

  root to: 'welcome#index'
end
