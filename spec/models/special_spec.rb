RSpec.describe Special do
  describe 'Validations' do

    describe 'Relationships' do
      it 'belongs to one comedian' do
        association = described_class.reflect_on_association(:comedian)
        
        expect(association.macro).to eq :belongs_to
      end
    end

    describe 'Required Field(s)' do
      it 'should be invalid if missing a title' do
        special = Special.create(runtime: 60, comedian_id: 1)

        expect(special).to_not be_valid
      end

      it 'should be invalid if missing a comedian_id' do
        special = Special.create(title: 'A Funny Show', runtime: '60')

        expect(special).to_not be_valid
      end

    end
  end
end
