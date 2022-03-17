Rails.application.routes.draw do
  scope'(:locale)', locale: /pt-BR|en/ do
    devise_for :users
    resources :categories, except: [:show]
    root 'articles#index'
    
    resources :articles do
      resources :comments, only: %i[create destroy]
    end

    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end
end