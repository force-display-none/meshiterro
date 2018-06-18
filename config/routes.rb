Rails.application.routes.draw do
  devise_for :users
  root'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show]do #doとendではさむとurlの親子関係になる(このように主従関係を表現できるルーティングをネストすると言います)
  # 下記resourcesではなくresourceとなっている点に注意してください。単数にするとそのコントローラのidがリクエストに含まれなくなります。今回、post_commentsのshowページは必要ないため、resourceとしました
            resource :post_comments, only: [:create, :destroy]
            resource :favorites, only: [:create, :destroy]
            end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
