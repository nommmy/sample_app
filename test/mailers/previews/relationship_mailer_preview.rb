# Preview all emails at http://localhost:3000/rails/mailers/relationship_mailer
class RelationshipMailerPreview < ActionMailer::Preview

  def notice_followed
    followed = User.first
    following = User.second
    RelationshipMailer.notice_followed(followed, following)
  end

end
