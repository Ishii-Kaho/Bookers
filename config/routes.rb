Rails.application.routes.draw do
  # booksのindex,show,new,editのルーティングを自動で行う
  resources :books
  # homesのindex,show,new,editのルーティングを自動で行う
  resources :homes
  # topページのルーティング
  get 'top' => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
