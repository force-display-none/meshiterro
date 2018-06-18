Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]do #doとendではさむとurlの親子関係になる(このように主従関係を表現できるルーティングをネストすると言います)
  # 下記resourcesではなくresourceとなっている点に注意してください。単数にするとそのコントローラのidがリクエストに含まれなくなります。今回、post_commentsのshowページは必要ないため、resourceとしました
            resource :favorites, only: [:create, :destroy]
            resource :post_comments, only: [:create, :destroy]
            end
  # usersコントローラにはshowアクションしか定義していないのでonlyを使って不必要なルーティングが生成されるのを制限しています
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
