class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  # scope :including_replies, ->(id) { where(in_reply_to: id).where(user_id: id) }


  def self.search(search)
    if search
      self.where(['content LIKE ?', "%#{search}%"])
    else
      self.all
    end
  end

 private

  # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
