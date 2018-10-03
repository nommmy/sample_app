class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
 belongs_to :followed, class_name: "User"
 validates :follower_id, presence: true
 validates :followed_id, presence: true


 def Relationship.send_notice_email(followed, following)
   RelationshipMailer.notice_followed(followed, following).deliver_now
 end
end
