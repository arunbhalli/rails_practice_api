RSpec.describe 'GET /api/articles', type: :request do
  describe 'successfully' do
    before do
      post '/api/articles',
           params: { article: { title: 'God is great and he loves us',
                                body: 'This is my awesome article and most important thing' } }
    end

    it 'is expected to return a 201 response' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return message' do
      expect(JSON.parse(response.body)['message']).to eq 'Your article has been created'
    end
  end
  describe 'Un-successfully' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: '',
               body: 'This is my awesome article and most important thing'
             }
           }
    end

    it 'is expected to return a 422 response' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return an error  message' do
      expect(JSON.parse(response.body)['message']).to eq "Title can't be blank"
    end
  end
end
