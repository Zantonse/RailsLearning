class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :name, :email, :body
  validate :article_should_be_published

  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end

  def email_article_author
    puts "We will notify #{article.user.email} in Chapter 9"
  end

  def send_comment_email
    Notifier.comment_added(self).deliver
  end
end
