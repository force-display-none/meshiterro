class PostImage < ApplicationRecord
 attachment :image # ここを追加（_idは含めません => 画像アップロードに関しては<%= f.attachment_field :image %>で実装しています。指定するフィールド名はimage_idから_idを除いた名前を指定します。これはrefileのルールです。）

      belongs_to :user

      has_many :post_comments, dependent: :destroy
      has_many :favorites, dependent: :destroy

      validates :shop_name, presence: true
      validates :image, presence: true

      def favorited_by?(user)
      	  favorites.where(user_id: user.id).exists?
      end
end
