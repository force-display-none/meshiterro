class UsersController < ApplicationController
  def show
  	# ユーザー1件のデータを取得する記述です
  	  @user = User.find(params[:id])
    # 下記のように記述することで@post_imagesにはそのページのユーザー(@user)に紐づいた投稿(.post_images)のみを渡すことができるので全体の投稿ではなく、個人が投稿したもののみを表示することができます
  	  @post_images = @user.post_images.page(params[:page])
  end

  def edit
  	# ここもユーザー1件のデータを取得する記述です　編集用のビューにはform_forを使用しますのでユーザーの情報を一件取得する記述をしましょう。 params[:id]からユーザーの情報を取得し、インスタンス(@user)にしまいます
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

private
  def user_params
      params.require(:user).permit(:name, :profile_image)
  end
end
