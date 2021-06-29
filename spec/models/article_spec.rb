RSpec.describe Article, type: :model do
  describe 'database table' do
    it {
      is_expected
        .to have_db_column(:title)
        .of_type(:string)
    }
  end
  describe 'factory' do
    it 'is expected to be valid' do
      expect(create(:article)).to be_valid
    end
  end
end
