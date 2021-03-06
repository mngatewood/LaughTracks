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
        comic = Comedian.create(age: '50', city: 'Las Vegas, NV')
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing birthdate' do
        comic = Comedian.create(name: 'Mitch Hedberg', city: 'Las Vegas, NV')
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing a city' do
        comic = Comedian.create(name: 'Mitch Hedberg', age: '50')
        expect(comic).to_not be_valid
      end
      
    end

    describe 'Class Methods' do
      it 'should return the average age of all comedians' do
        Comedian.create(name: "Louis C.K.", age: "51", city: "Washington, D.C.")
        Comedian.create(name: "Chris Rock", age: "53", city: "Andrews, South Carolina")
        Comedian.create(name: "Jerry Seinfeld", age: "64", city: "Brooklyn, New York")

        average_age = Comedian.average_age
        expect(average_age).to eq 56
      end

      it 'should return unique cities for all comedians' do
        Comedian.create(name: "Louis C.K.", age: "51", city: "Washington, D.C.")
        Comedian.create(name: "Chris Rock", age: "53", city: "Andrews, South Carolina")
        Comedian.create(name: "Jerry Seinfeld", age: "64", city: "Brooklyn, New York")

        unique_cities = Comedian.unique_cities
        expect(unique_cities).to eq ["Andrews, South Carolina", "Washington, D.C.", "Brooklyn, New York"]
      end

    end

  end
end
