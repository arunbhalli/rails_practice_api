RSpec.describe 'GET /api/articles', type: :request do
  let!(:articles) { 3.times { create(:article, title: 'God is great') } }
  describe 'successfully' do
    before do
      get '/api/articles'
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return three articles' do
      expect(JSON.parse(response.body)['articles'].count).to eq 3
    end
    it 'is expected to return articles title' do
      expect(JSON.parse(response.body)['articles'].first['title']).to eq 'God is great'
    end
  end
end
