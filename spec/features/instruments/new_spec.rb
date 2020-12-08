require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a section instruments index page" do
    describe "I click a link to create an instrument" do
      it "allows me to create a new instrument" do
        clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

        p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
        vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

        visit "/sections/#{clarinet.id}/instruments"
        save_and_open_page
        click_link 'Create Instrument'
        expect(current_path).to eq("/sections/#{clarinet.id}/instruments/new")

        fill_in 'Name', with: 'Auxiliary'
        fill_in 'Date Hired', with: '2015-02-15'
        fill_in 'Age', with: 40
        fill_in 'Section ID', with: "#{clarinet.id}"
        click_on 'Create Section'

        expect(current_path).to eq("/sections/#{clarinet.id}")
        expect(page).to have_content('2015-02-15')
        expect(page).to have_content(40)
        expect(page).to have_content("Auxiliary")
      end
    end
  end
end
