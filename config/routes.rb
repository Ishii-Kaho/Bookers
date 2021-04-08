Rails.application.routes.draw do
  # booksのindex,show,new,editのルーティングを自動で行う
  resource :books
  # homesのindex,show,new,editのルーティングを自動で行う
  resource :homes
  # topページのルーティング
  get 'top' => 'homes#top'
  # indexページのルーティング
  get 'index' => 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
