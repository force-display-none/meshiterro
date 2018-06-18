class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_images
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # CARAVANとPostImageに画像投稿機能を実装した時と同様にRefileを使用するので下記の記述をしています
  # 追加したカラム名(profile_image_id)から_idを取ったprofile_imageをattachmentを使って追加しています
  attachment :profile_image

end
