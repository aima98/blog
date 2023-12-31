class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
