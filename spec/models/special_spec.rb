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

    describe 'Class Methods' do

      it 'should return the average runtime of all specials' do
        Special.create(title: "Louis C.K. 2017", runtime: 74, comedian_id: 1)
        Special.create(title: "Louis C.K.: Shameless", runtime: 56, comedian_id: 1)
        Special.create(title: "Louis C.K.: Live at the Comedy Store", runtime: 66, comedian_id: 1)

        average_runtime = Special.average_runtime
        expect(average_runtime).to eq 65
      end

    end
  end
end
