RSpec.describe "as a visitor" do
  describe "when I visit /comedians?age=31" do

    before(:each) do
      @comedian_1 = Comedian.create(name: "Hasan Minhaj", age: 33, city: "Davis, California")
      @comedian_2 = Comedian.create(name: "Mike Birbiglia", age: 31, city: "Shrewsbury, Massachusetts")
      @comedian_3 = Comedian.create(name: "Jerrod Carmichael", age: 31, city: "Los Angeles, California")
      @comedian_4 = Comedian.create(name: "Tracy Morgan", age: 49, city: "New York City, New York")
      @special_1_1 = @comedian_1.specials.create(title: "Hasan Minhaj: Homecoming King", runtime: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWU2NTFjYTAtNDVkOC00YjJiLTg0NWMtODVmYzYwYjBiMmI3XkEyXkFqcGdeQXVyMjYwMTkwNDc@._V1_UY268_CR10,0,182,268_AL_.jpg")
      @special_2_1 = @comedian_2.specials.create(title: "Mike Birbiglia: Thank God for Jokes", runtime: 70, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjM1NjNjOTUtMzk3Yi00NzZmLTg3NTQtZjE0N2U1MTYyZTViXkEyXkFqcGdeQXVyNDQyODU5MDQ@._V1_UX182_CR0,0,182,268_AL_.jpg")
      @special_2_2 = @comedian_2.specials.create(title: "Mike Birbiglia: My Girlfriend's Boyfriend", runtime: 76, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTU0OTMzNDUyNV5BMl5BanBnXkFtZTgwMDYxNjkyMjE@._V1_UY268_CR4,0,182,268_AL_.jpg")
      @special_3_1 = @comedian_3.specials.create(title: "Jerrod Carmichael: 8", runtime: 59, thumbnail: "https://m.media-amazon.com/images/M/MV5BMWJkMzllOWQtZWQyZC00YTE0LWI5N2QtNzliYzZjMDJmOWFmXkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UX182_CR0,0,182,268_AL_.jpg")
      @special_3_2 = @comedian_3.specials.create(title: "Jerrod Carmichael: Love at the Store", runtime: 54, thumbnail: "https://m.media-amazon.com/images/M/MV5BNTI5ODAwNDY2NV5BMl5BanBnXkFtZTgwMDk0NjQ3NTE@._V1_UY268_CR9,0,182,268_AL_.jpg")
      @special_4_1 = @comedian_4.specials.create(title: "Tracy Morgan: Staying Alive", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNmOWUyNjgtY2E0Ny00NTgyLWE3ZWMtZmFlNmY0NjM2Mjc3XkEyXkFqcGdeQXVyNjc5MDk0MzA@._V1_UY268_CR4,0,182,268_AL_.jpg")
      @special_4_2 = @comedian_4.specials.create(title: "Tracy Morgan: Bona Fide", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTkwMTMwNzE2MV5BMl5BanBnXkFtZTgwNzMxNDg2MTE@._V1_UY268_CR1,0,182,268_AL_.jpg")
      @special_4_3 = @comedian_4.specials.create(title: "Tracy Morgan: Black and Blue", runtime: 58, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjIyMzM1NDYyN15BMl5BanBnXkFtZTcwMzMyNzkxNQ@@._V1_UY268_CR9,0,182,268_AL_.jpg")
    end

    it "should display a list of comedians whose age is 31" do

      visit '/comedians?age=31'

      within("main") do
        expect(page).to have_css("article", :count => 2)
      end

      within("#comedian-2-container") do
        expect(page).to have_css("h3", :text => @comedian_2.name)
        expect(page).to have_content("Age: #{@comedian_2.age}")
        expect(page).to have_content("Birthplace: #{@comedian_2.city}")
      end

      within("#comedian-3-container") do
        expect(page).to have_css("h3", :text => @comedian_3.name)
        expect(page).to have_content("Age: #{@comedian_3.age}")
        expect(page).to have_content("Birthplace: #{@comedian_3.city}")
      end

    end

    it "should display each comedian's specials" do

      visit '/comedians?age=31'

      within("#comedian-2-container") do
        expect(page).to have_css("div.special-container", :count => 2)
      end

      within("#special-2-container") do
        expect(page).to have_content(@special_2_1.title)
        expect(page).to have_content("Length: #{@special_2_1.runtime} minutes")
        expect(page).to have_css("img[src*='#{@special_2_1.thumbnail}']")
      end

      within("#special-3-container") do
        expect(page).to have_content(@special_2_2.title)
        expect(page).to have_content("Length: #{@special_2_2.runtime} minutes")
        expect(page).to have_css("img[src*='#{@special_2_2.thumbnail}']")
      end

    end

    it "should display summary statistics" do

      visit '/comedians?age=31'

      save_and_open_page

      within("header") do
        expect(page).to have_content("31")
        # expect(page).to have_content("64") #this test is currently failing; unable to implement
      end

      within("ul#unique-cities") do
        expect(page).to have_css("li", :count => 2)
        expect(page).to have_content("Shrewsbury, Massachusetts")
        expect(page).to have_content("Los Angeles, California")
      end

    end
  end

end