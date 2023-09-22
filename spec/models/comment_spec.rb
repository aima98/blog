require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'updates the post comments_counter attribute' do
      user = User.create(name: 'Htet')
      post = Post.create(title: 'Hello', author: user)

      Comment.create(author: user, post:, text: 'This is comment')

      expect(post.reload.comment_counter).to eq(1)
    end
  end
end
