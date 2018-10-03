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
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
end
