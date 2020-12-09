require 'rails-helper'

RSpec.describe "Instrument Update" do
    describe "As a visitor" do
        describe "When I visit an instrument show page" do
            it "I can update an instrument" do
                clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
                p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
                
                visit "/instruments/#{clarinet.id}"

                click_link 'Edit'

                expect (current_path).to eq("/instrument/#{clarinet.id}/edit")

                fill_in 'Name', with: 'Auxilliary'
                fill_in 'date_hired', with: '2012-02-02'
                fill_in 'age', with: '90'
                click_on 'Update Instrument'

                expect (current_path).to eq("/instrument/#{clarinet.id}")
                expect (page).to have_content("Auxilliary")
            end
        end
    end
end