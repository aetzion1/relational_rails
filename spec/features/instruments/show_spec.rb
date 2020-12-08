require 'rails_helper'

RSpec.describe "Instrument show page" do
    describe "As a visitor" do
        it "When I visit an instrument/:id page" do
            clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
                
            p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)

            visit "/instruments/#{p_clarinet.id}"
            save_and_open_page
            expect(page).to have_content(p_clarinet.name)
            expect(page).to have_content(p_clarinet.date_hired)
            expect(page).to have_content(p_clarinet.age)
            expect(page).to have_content(p_clarinet.section.name)

        end
    end
end