class Article < ActiveRecord::Base
  validates_presence_of :title, :body

  belongs_to :user
  has_and_belongs_to_many :categories

  def long_title
    "#{title} - #{published_at}"
  end
end
