Rails.application.routes.draw do
  # topページを/URLに変更する
  root to: 'homes#top'
  # booksのindex,show,new,editのルーティングを自動で行う
  resources :books
  # homesのindex,show,new,editのルーティングを自動で行う
  resources :homes
  # topページのルーティング
  get 'top' => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
