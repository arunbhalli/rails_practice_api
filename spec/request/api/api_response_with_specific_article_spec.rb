RSpec.describe 'GET /api/articles/:id', type: :request do
  let!(:article) { create(:article, title: 'Fun with Rspec',body: 'This is my awesome article') }
  describe 'successfully' do
    before do
      get "/api/articles/#{article.id}"
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to include title' do
      expect(JSON.parse(response.body)['article']['title']).to eq 'Fun with Rspec'
    end
    it 'is expected to include body' do
      expect(JSON.parse(response.body)['article']['body']).to eq 'This is my awesome article'
    end
  end
end
