class PostImagesController < ApplicationController

      # 画像投稿画面を表示するためのアクションメソッド
  def new
      @post_image = PostImage.new
  end

  def create
      @post_image = PostImage.new(post_image_params)
      @post_image.user_id = current_user.id
      if @post_image.save
      # 投稿画像をPostImageモデルに保存した後、リダイレクトで投稿一覧画面へ戻ります
         redirect_to post_images_path
      else
         render :new
      end
  end

  def index
      # @post_images = PostImage.all
      @post_images = PostImage.page(params[:page]).reverse_order
      # タイムライン上に表示するするために保存された投稿画像を全て取得し@post_imagesという変数に保存します＝＞1ページ分の決められた数のデータを新しい順に取得するように変更しました
  end

  def show
      @post_image = PostImage.find(params[:id])
      @post_comment = PostComment.new
  end

  def destroy
      # @post_image = PostImage.find(params[:id])の部分では先に作成したresourcesルーティングのdestroyで渡ってきたパラメータ(params[:id])を元に削除するデータをfindメソッドを使って探して@post_imageインスタンスにしまいます
      @post_image = PostImage.find(params[:id])
      # @post_image.destroyでは、@post_imageインスタンスにしまったデータをdestroyメソッドで削除します。削除後は一覧ページのindexページへ遷移するためにedirect_toを記述しています。
      @post_image.destroy
      redirect_to post_images_path
  end

  # 投稿画像についてのハッシュチェック、ストロングパラメータの定義
  # post_image_paramsでは、投稿画像として送信されたデータが許可されているパラメータかどうかのチェックを行います
private
  def post_image_params
      params.require(:post_image).permit(:shop_name, :image, :caption, :user_id)
  end
end
