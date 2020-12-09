require 'rails_helper'

RSpec.describe "New Instrument Page" do
  describe "As a visitor" do
    describe "visit a section instruments index page" do
      it "creates a new instrument" do
        clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

        p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
        vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

        visit "/sections/#{clarinet.id}/instruments"

        click_link 'Create Instrument'

        expect(current_path).to eq("/sections/#{clarinet.id}/instruments/new")

        fill_in 'Name', with: 'Auxiliary'
        fill_in 'date_hired', with: '2015-02-15'
        fill_in 'Age', with: 40
        click_on 'Create Instrument'

        expect(current_path).to eq("/sections/#{clarinet.id}/instruments")
        expect(page).to have_content('2015-02-15')
        expect(page).to have_content(40)
        expect(page).to have_content("Auxiliary")
      end
    end
  end
end