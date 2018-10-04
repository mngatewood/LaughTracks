RSpec.describe "as a visitor" do
  describe "when I visit the comedians page" do

    before(:each) do
      @comedian_1 = Comedian.create(name: "Louis C.K.", birthdate: "September 12, 1967", city: "Washington, D.C.")
      @comedian_2 = Comedian.create(name: "Chris Rock", birthdate: "February 7, 1965", city: "Andrews, South Carolina")
      @comedian_3 = Comedian.create(name: "Jerry Seinfeld", birthdate: "April 29, 1954", city: "Brooklyn, New York")
      @special_1_1 = @comedian_1.specials.create(title: "Louis C.K. 2017", runtime: 74, thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      @special_1_2 = @comedian_1.specials.create(title: "Louis C.K.: Shameless", runtime: 56, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjE4NjE1ODI5Ml5BMl5BanBnXkFtZTcwMTgxNjc0MQ@@._V1_UY268_CR4,0,182,268_AL_.jpg")
      @special_1_3 = @comedian_1.specials.create(title: "Louis C.K.: Live at the Comedy Store", runtime: 66, thumbnail: "https://m.media-amazon.com/images/M/MV5BODJlMmIyNjEtZDQ0ZS00MGIyLWEyZmYtOTQyYTQyMWJkODhmXkEyXkFqcGdeQXVyMjQ0ODQ0MzQ@._V1_UX182_CR0,0,182,268_AL_.jpg")
      @special_2_1 = @comedian_2.specials.create(title: "Chris Rock: Kill the Messenger - London, New York, Johannesburg", runtime: 79, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_UY268_CR11,0,182,268_AL_.jpg")
      @special_2_2 = @comedian_2.specials.create(title: "Chris Rock: Never Scared", runtime: 80, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTlhYzMzNzItNWMyYy00ZGRlLWI1N2UtOGI2YjIwOGEwYTViXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UX182_CR0,0,182,268_AL_.jpg")
      @special_3_1 = @comedian_3.specials.create(title: "Jerry Seinfeld: 'I'm Telling You for the Last Time'", runtime: 75, thumbnail: "https://m.media-amazon.com/images/M/MV5BNDM4OTY0NTAyMF5BMl5BanBnXkFtZTcwNTcxMDQyMQ@@._V1_UY268_CR0,0,182,268_AL_.jpg")
    end

    it "should display a list of comedians" do

      visit '/comedians'

      within("main") do
        expect(page).to have_css("article", :count => 3)
      end

      within("#comedian-1-container") do
        expect(page).to have_css("h3", :text => @comedian_1.name)
        expect(page).to have_content("Age: 51")
        expect(page).to have_content("Birthplace: #{@comedian_1.city}")
      end

      within("#comedian-2-container") do
        expect(page).to have_css("h3", :text => @comedian_2.name)
        expect(page).to have_content("Age: 53")
        expect(page).to have_content("Birthplace: #{@comedian_2.city}")
      end

    end

    it "should display each comedian's specials" do

      visit '/comedians'

      within("#comedian-1-container") do
        expect(page).to have_css("div.special-container", :count => 3)
      end

      within("#comedian-1-specials") do
        expect(page).to have_content(@special_1_1.title)
        expect(page).to have_content("Length: #{@special_1_1.runtime} minutes")
        expect(page).to have_css("img[src*='#{@special_1_1.thumbnail}']")
      end

      within("#comedian-2-specials") do
        expect(page).to have_content(@special_2_1.title)
        expect(page).to have_content("Length: #{@special_2_1.runtime} minutes")
        expect(page).to have_css("img[src*='#{@special_2_1.thumbnail}']")
      end

    end

    it "should display summary statistics" do

      comedian_4 = Comedian.create(name: "Dave Chappelle", birthdate: "August 24, 1973", city: "Washington, D.C.")

      visit '/comedians'

      within("header") do
        expect(page).to have_content("53")
        expect(page).to have_content("71")
      end

      within("ul#unique-cities") do
        expect(page).to have_css("li", :count => 3)
        expect(page).to have_content("Washington, D.C.")
        expect(page).to have_content("Andrews, South Carolina")
        expect(page).to have_content("Brooklyn, New York")
      end

    end
  end

end