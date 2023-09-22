require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    it 'updates the post likes_counter attribute' do
      user = User.create(name: 'Htet')
      post = Post.create(title: 'Hello', author: user)

      Like.create(user:, post:)

      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
