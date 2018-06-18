class PostImage < ApplicationRecord
    belongs_to :user
    attachment :image # ここを追加（_idは含めません => 画像アップロードに関しては<%= f.attachment_field :image %>で実装しています。指定するフィールド名はimage_idから_idを除いた名前を指定します。これはrefileのルールです。）
end
