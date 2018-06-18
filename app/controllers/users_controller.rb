class UsersController < ApplicationController
  def show
  	# ユーザー1件のデータを取得する記述です
  	  @user = User.find(params[:id])
    # 下記のように記述することで@post_imagesにはそのページのユーザー(@user)に紐づいた投稿(.post_images)のみを渡すことができるので全体の投稿ではなく、個人が投稿したもののみを表示することができます
  	  @post_images = @user.post_images.page(params[:page])
  end
end
