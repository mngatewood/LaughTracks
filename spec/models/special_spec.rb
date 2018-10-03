RSpec.describe Special do
  describe 'Validations' do

    describe 'Relationships' do
      it 'belongs to one comedian' do
        association = described_class.reflect_on_association(:comedian)
        
        expect(association.macro).to eq :belongs_to
      end
    end

    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create

        expect(special).to_not be_valid
      end
    end
  end
end
