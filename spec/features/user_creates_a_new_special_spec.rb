RSpec.describe "as a visitor" do
  describe "when I visit /comedians/new" do

    it "should display a form to create a new comedian" do

      visit '/comedians/new'

      within("#new-comedian") do
        expect(page).to have_content("Enter comedian information")
      end

    end
  end

  describe "when I enter comedian information and click submit" do

    it "should redirect user to index page and display new comedian" do

      visit '/comedians/new'

      fill_in("comedian[name]", with: "Ian Douglas")
      fill_in("comedian[age]", with: "48")
      fill_in("comedian[city]", with: "Montreal, Quebec, Canada")
      click_button("Submit")
      expect(current_path).to eq("/comedians")
      expect(page).to have_content("Ian Douglas")

    end
  end

end