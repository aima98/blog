require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /users/:user_id/posts/:post_id/comments/new' do
    it 'returns http success' do
      user_id = 1
      post_id = 2
      get new_user_post_comment_path(user_id:, post_id:)
      expect(response).to have_http_status(:success)
    end
  end
end
