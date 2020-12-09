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
        it 'It displays an delete instrument link that redirects to the index page' do
          clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
          p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
          vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)
          visit "/instruments/#{p_clarinet.id}"
          click_button 'Delete Instrument'
          expect(current_path).to eq("/sections/#{clarinet.id}/instruments")
          expect(current_path).to_not have_content(p_clarinet.name)
          expect(current_path).to_not have_content(p_clarinet.date_hired)
          expect(current_path).to_not have_content(p_clarinet.age)
        end
    end
end