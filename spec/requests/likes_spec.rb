RSpec.describe 'Likes', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      user_id = 1
      post_id = 2
      get new_user_post_like_path(post_id:, user_id:)
      expect(response).to have_http_status(:success)
    end
  end
end
