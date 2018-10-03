class RelationshipMailer < ApplicationMailer

  def notice_followed(followed, following)
    @followed = followed
    @following = following
    mail to: followed.email, subject: "You were followed"
  end
end
