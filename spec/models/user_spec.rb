require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Jame') }

  context 'validation tests' do
    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'posts_counter should be integer' do
      user.posts_counter = 'Hi'
      expect(user).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to zero' do
      user.posts_counter = -2
      expect(user).to_not be_valid
      user.posts_counter = 0
      expect(user).to be_valid
    end
  end

  context 'three_most_recent_posts' do
    it 'returns the 3 most recent posts' do
      user = User.create(name: 'Hary')
      post1 = Post.create(title: 'post1', author: user, created_at: 4.days.ago)
      post2 = Post.create(title: 'post2', author: user, created_at: 3.days.ago)
      post3 = Post.create(title: 'post3', author: user, created_at: 2.days.ago)

      recent_posts = user.recent_posts
      expect(recent_posts).to eq([post3, post2, post1])
    end
  end
end
