RSpec.describe Comedian do
  describe 'Validations' do

    describe 'Relationships' do
      it 'should has_many specials' do
        association = described_class.reflect_on_association(:specials)
  
        expect(association.macro).to eq :has_many
      end
    end


    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(birthdate: 'September 12, 1967', city: 'Las Vegas, NV')
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing birthdate' do
        comic = Comedian.create(name: 'Mitch Hedberg', city: 'Las Vegas, NV')
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing a city' do
        comic = Comedian.create(name: 'Mitch Hedberg', birthdate: 'September 12, 1967')
        expect(comic).to_not be_valid
      end
      
    end
  end
end
